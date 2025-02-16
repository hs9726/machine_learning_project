<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>중고차 가격 예측</title>
<style>
.form-group {
	margin-bottom: 15px;
}

label {
	display: inline-block;
	width: 150px;
}
</style>
</head>
<body>
	<h2>중고차 가격 예측</h2>
	<form id="predictionForm" action="/car/getPrediction" method="post">
		<div class="form-group">
			<label>연식 (Year):</label> <input type="number" name="year" min="2000"
				max="2024" required>
		</div>

<!-- 		<div class="form-group"> -->
<!-- 			<label>출고가 (Present_Price):</label> <input type="number" -->
<!-- 				name="presentPrice" step="0.1" required> -->
<!-- 		</div> -->

		<div class="form-group">
			<label>주행거리 (Kms_Driven):</label> <input type="number"
				name="kmsDriven" min="0" required>
		</div>

		<div class="form-group">
			<label>Fuel Type:</label> <select name="fuelType" id="fuelTypeSelect"
				required onchange="updateFuelTypeValues()">
				<option value="">선택하세요</option>
				<option value="CNG">CNG</option>
				<option value="Diesel">Diesel</option>
				<option value="Petrol">Petrol</option>
			</select>
			<!-- hidden inputs for fuel type -->
			<input type="hidden" name="fuelTypeCng" id="fuel_type_cng"
				value="false"> <input type="hidden" name="fuelTypeDiesel"
				id="fuel_type_diesel" value="false"> <input type="hidden"
				name="fuelTypePetrol" id="fuel_type_petrol" value="false">
		</div>

		<div class="form-group">
			<label>Seller Type:</label> <select name="sellerType"
				id="sellerTypeSelect" required onchange="updateSellerTypeValues()">
				<option value="">선택하세요</option>
				<option value="Dealer">Dealer</option>
				<option value="Individual">Individual</option>
			</select>
			<!-- hidden inputs for seller type -->
			<input type="hidden" name="sellerTypeDealer"
				id="seller_type_dealer" value="false"> <input type="hidden"
				name="sellerTypeIndividual" id="seller_type_individual"
				value="false">
		</div>

		<div class="form-group">
			<label>Transmission:</label> <select name="transmission"
				id="transmissionSelect" required
				onchange="updateTransmissionValues()">
				<option value="">선택하세요</option>
				<option value="Automatic">Automatic</option>
				<option value="Manual">Manual</option>
			</select>
			<!-- hidden inputs for transmission -->
			<input type="hidden" name="transmissionAutomatic"
				id="transmission_automatic" value="false"> <input
				type="hidden" name="transmissionManual" id="transmission_manual"
				value="false">
		</div>

		<div class="form-group">
			<label>소유자 수 (Owner):</label> <select name="owner" id="ownerSelect"
				required onchange="updateOwnerValues()">
				<option value="">선택하세요</option>
				<option value="0">First Owner</option>
				<option value="1">Second Owner</option>
				<option value="3">Third Owner</option>
			</select>

			<!-- hidden input fields for owner values -->
			<input type="hidden" name="owner0" id="owner_0" value="false">
			<input type="hidden" name="owner1" id="owner_1" value="false">
			<input type="hidden" name="owner3" id="owner_3" value="false">
		</div>

		<button id="btn" type="submit">가격 예측하기</button>
	</form>

	<div id="result" class="mt-3 text-lg font-bold"></div>


	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	function updateFuelTypeValues() {
	    document.getElementById('fuel_type_cng').value = 'false';
	    document.getElementById('fuel_type_diesel').value = 'false';
	    document.getElementById('fuel_type_petrol').value = 'false';
	    
	    const selected = document.getElementById('fuelTypeSelect').value;
	    if(selected) {
	        document.getElementById('fuel_type_' + selected.toLowerCase()).value = 'true';
	    }
	}

	function updateSellerTypeValues() {
	    document.getElementById('seller_type_dealer').value = 'false';
	    document.getElementById('seller_type_individual').value = 'false';
	    
	    const selected = document.getElementById('sellerTypeSelect').value;
	    if(selected) {
	        document.getElementById('seller_type_' + selected.toLowerCase()).value = 'true';
	    }
	}

	function updateTransmissionValues() {
	    document.getElementById('transmission_automatic').value = 'false';
	    document.getElementById('transmission_manual').value = 'false';
	    
	    const selected = document.getElementById('transmissionSelect').value;
	    if(selected) {
	        document.getElementById('transmission_' + selected.toLowerCase()).value = 'true';
	    }
	}
	
	function updateOwnerValues() {
	    // 모든 owner 값을 먼저 false로 초기화
	    document.getElementById('owner_0').value = 'false';
	    document.getElementById('owner_1').value = 'false';
	    document.getElementById('owner_3').value = 'false';

	    // 선택된 값에 따라 해당하는 owner 값만 true로 설정
	    const selectedValue = document.getElementById('ownerSelect').value;
	    if(selectedValue) {
	        document.getElementById('owner_' + selectedValue).value = 'true';
	    }
	}
//         const formData = new FormData(e.target);
//         const response = await fetch('/car/getPrediction', {
//             method: 'POST',
//             body: formData
//         });
        
//         const data = await response.json();
//         document.getElementById('result').innerHTML = 
//             ${data.predicted_price.toLocaleString()}원`;
    let onbtn = function(e) {
        e.preventDefault();
        
		
		var formData = new FormData(document.getElementById('predictionForm'));
		axios.post(`/car/getPrediction`, formData
			).then(resp => {
				// resp.data는 이미 문자열에서 파싱된 JSON 객체
			    console.log('받은 데이터:', resp.data);
			    
			    // predicted_price를 숫자로 변환
			    const predictedLakhs = Number(resp.data.predicted_price);
			    console.log('Lakhs 값:', predictedLakhs);
			    
			    const koreanWon = predictedLakhs * 2000000;
			    console.log('원화 값:', koreanWon);
			    
			    const resultElement = document.getElementById('result');
			    if(resultElement) {
			        resultElement.innerHTML = '예상 가격: ' + koreanWon.toLocaleString() + '원';
			    }
			})
			.catch(error => {
			    console.error('에러:', error);
			    document.getElementById('result').innerHTML = '가격 예측 중 오류가 발생했습니다.';
			});
    }
			
    
    $(document).on('click', '#btn', onbtn);
    </script>
</body>
</html>