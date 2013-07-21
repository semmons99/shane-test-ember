require "sinatra"

configure :production do
  require "newrelic_rpm"
end

get "/" do
  expires 36000, :public, :must_revalidate
  erb :index
end

__END__

@@ index
<!DOCTYPE html>
<html>
<head>
<%= ::NewRelic::Agent.browser_timing_header rescue "" %>
<meta charset="utf-8">
<title>Welcome to The Snapper</title>
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/normalize/2.1.0/normalize.min.css">
</head>
<body>

  <script type="text/x-handlebars">
    <h2>Welcome to The Snapper</h2>

    {{outlet}}
  </script>

  <script type="text/x-handlebars" data-template-name="index">
    <table border="1">
      <thead>
        <tr>
          <td>Login</td>
          <td>Email</td>
          <td>First Name</td>
          <td>Last Name</td>
        </tr>
      </thead>
      <tbody>
        {{#each model}}
          <tr class="user">
            <td>{{login}}</td>
            <td>{{email}}</td>
            <td>{{first_name}}</td>
            <td>{{last_name}}</td>
          </tr>
        {{/each}}
      </tbody>
    </ul>
  </script>

  <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.0.0-rc.4/handlebars.min.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/ember.js/1.0.0-rc.6/ember.min.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/ember-data.js/0.13.0/ember-data-latest.min.js"></script>
  <script src="http://60d5fd228b6b7f6b3045-94063cb6fdfc14ba618268f472941aac.r32.cf1.rackcdn.com/app.js"></script>

  <%= ::NewRelic::Agent.browser_timing_footer rescue "" %>
</body>
</html>
