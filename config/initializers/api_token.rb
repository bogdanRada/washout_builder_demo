  TestApp::Application.config.api_auth_token  = 'iyFGGfLz1mIjegs6PZ5YkbIYXgNfkeWAR1xqoeZUNKNgFsWxBsoAfLTSXcy42iS3spE6fvvveafR98Iza3bKttK8L8zMvbkylemO'

  if Rails.env.development?
  TestApp::Application.config.api_namespace = "http://localhost:3000/api/"
else
    TestApp::Application.config.api_namespace = "https://washout-builder.herokuapp.com/api/"
end