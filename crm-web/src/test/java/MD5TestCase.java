import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;

/**
 * Created by hoyt on 2017/11/12.
 */

public class MD5TestCase {

    @Test
    public void md5Test() {
        String salt = "%$%$1234asdaDFG%%^@#SDF#$#%";
        String password = "123456";
        String newpwd = DigestUtils.md5Hex(salt + password);
        System.out.println(newpwd);
    }
}
