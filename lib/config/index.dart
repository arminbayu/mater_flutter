String env = "development";
// String env = "production";

String base_url = 'https://api.fasapay.com/';
String url_master = (env == "development")
    ? "https://sandbox.fasapay.com/xml"
    : "https://api.fasapay.com/";
String url = (env == "development") ? "sandbox.fasapay.com" : "api.fasapay.com";
