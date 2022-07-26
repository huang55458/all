package exception;

/**
 * @Author Zhoupiyao
 * @Create 2021/10/7
 * @Time 14:20
 **/
public class UserDeleteFailedException extends RuntimeException{
    private String message;
    public UserDeleteFailedException() {
    }

    public UserDeleteFailedException(String message) {
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
