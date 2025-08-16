package com.canchas.reservas.config;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

@Configuration
public class FirebaseConfig {

    @PostConstruct
    public void init() {
        try {
            String firebaseJson = System.getenv("FIREBASE_CONFIG"); // Lee variable de entorno
            if (firebaseJson == null) {
                throw new RuntimeException("Variable de entorno FIREBASE_CONFIG no definida");
            }

            InputStream serviceAccount = new ByteArrayInputStream(firebaseJson.getBytes(StandardCharsets.UTF_8));

            FirebaseOptions options = FirebaseOptions.builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .build();

            if (FirebaseApp.getApps().isEmpty()) {
                FirebaseApp.initializeApp(options);
            }

            System.out.println("Firebase Admin inicializado correctamente");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
