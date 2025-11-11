package uz.pdp.jakarta_ee.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.security.Timestamp;
import java.util.Date;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {
    private UUID id;
    private Date createdAt;
    private String firstName;
    private String lastName;
    private String username;
    private String email;
    private String password;
}
