package runner;

import static org.junit.Assert.assertTrue;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import io.cucumber.junit.CucumberOptions;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

@CucumberOptions(features = "src/main/resources/features")
public class Runner 
{
	private static final int NUM_THREAD = 1;

	@Test
	public void testPass() throws Exception {
		Results results = Runner.parallel(getClass(), NUM_THREAD);
		generateReport(results.getReportDir());
		assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
		
	}

	public void generateReport(String karateOutputPath) throws Exception {
		Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
		List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
		jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
		Configuration config = new Configuration(new File("report"), "Imobiliaria Digital API Tests");
		ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
		reportBuilder.generateReports();
	}
}