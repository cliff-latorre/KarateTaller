import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("classpath:com/api/automation")
                .outputCucumberJson(true)
                .outputJunitXml(true)
                .tags("~@ignore");
    }
}
