data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../../src"
  output_path = "src.zip"
}

resource "aws_lambda_function" "api" {
  depends_on       = [aws_iam_role.lambda_role]
  filename         = data.archive_file.lambda_zip.output_path
  function_name    = "api"
  role             = aws_iam_role.lambda_role.arn
  handler          = "main.handler"
  runtime          = "python3.10"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}
