package com.example.signapp.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.signapp.dto.SignForm;
import com.example.signapp.mapper.SignMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class SignService {
    @Autowired
    private SignMapper signMapper;

    public boolean saveSignImageAndSetFileName(SignForm signForm, int level) {
        String ext = ".png";
        String filename = UUID.randomUUID().toString().replace("-", "") + ext;

        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream("c:\\sign_img\\" + filename);
            // signForm에 들어있는 base64 이미지 데이터에서 "data:image/png;base64," 제거 후 디코딩
            String base64Img = null;
            if(level == 1) {
                base64Img = signForm.getFileNameLv1().split(",")[1];
                signForm.setFileNameLv1(filename);
            } else {
            	log.info("test"+filename);
            	base64Img = signForm.getFileNameLv2().split(",")[1];
                signForm.setFileNameLv2(filename);
            }
            fos.write(Base64.getDecoder().decode(base64Img));
        } catch (FileNotFoundException e) {
            log.error("파일 생성 실패 @Transactional 롤백");
            throw new RuntimeException(e);
        } catch (IOException e) {
            log.error("파일 디코딩 실패 @Transactional 롤백");
            throw new RuntimeException(e);
        } finally {
            try {
                if (fos != null) fos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return true;
    }

    public void addSignLevel1(SignForm signForm) {
        signMapper.addSignLevel1(signForm);
    }

    public void addSignLevel2(SignForm signForm) {
        signMapper.addSignLevel2(signForm);
    }
}
