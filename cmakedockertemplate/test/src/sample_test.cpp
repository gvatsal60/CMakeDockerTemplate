#include <gtest/gtest.h>

#include "memlib.h"
#include "utils.h"

// Define a test case for the println function
TEST(PrintlnTest, PrintsCorrectly) {
  // Redirect stdout to a pipe
  testing::internal::CaptureStdout();

  // Call the function to be tested
  println("Hello, world!");

  // Get the output from stdout
  std::string output = testing::internal::GetCapturedStdout();

  // Check if the output matches the expected string
  EXPECT_EQ(output, "Hello, world!\n");
}
