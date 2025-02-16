package kr.or.machinelearning.controller;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.machinelearning.dto.CarDTO;



@Controller
@SpringBootApplication
@RequestMapping("/car")
public class PredictionController {
	
    // 예측 페이지 보여주기
    @GetMapping("/predict")
    public String showPredictForm() {
        return "PredictPrice";  // predict.jsp로 연결
    }
    
    // 예측 실행
    @PostMapping("/getPrediction")
    @ResponseBody
    public ResponseEntity<String> getPrediction(CarDTO carDTO) {
        try {
            // Flask API URL
        	String flaskApiUrl = "ngrok";
            
            System.out.println(carDTO.toString());
            
         // 요청 데이터 생성
         // ObjectMapper를 사용해 DTO를 JSON 문자열로 변환
            ObjectMapper objectMapper = new ObjectMapper();
            String jsonBody = objectMapper.writeValueAsString(carDTO);
            
            // Flask API 호출
            RestTemplate restTemplate = new RestTemplate();
            
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<String> requestEntity = new HttpEntity<>(jsonBody, headers);

            ResponseEntity<String> response = restTemplate.postForEntity(
                flaskApiUrl,
                requestEntity,  // Map 객체를 직접 전송
                String.class
            );
            
            return ResponseEntity.ok(response.getBody());
            
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body("{\"error\": \"" + e.getMessage() + "\"}");
        }
    }
}