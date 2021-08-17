package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


public class LoginCommandValidator implements Validator{
@Override
public boolean supports(Class<?> clazz) {
	// TODO Auto-generated method stub
	return false;
}
	
	public void validate(Object Object,Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "userId", "required");
		ValidationUtils.rejectIfEmpty(errors, "userPw", "required");
	}
}
