package dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class Freeboard {

	private int idx;
	private String name;
	private String password;
	private String subject;
	private String content;
	private int readCount;
	private Timestamp wdate;
	private String ip;
	private short commentCount;
}
