<p align="center">
  <sub>🛫</sub>
  <br/><i>FLYSEUM</i>
  <br/><sub>European flight booking website</sub>
</p>

Flyseum is a Web Development project for academic purposes. It's a little maven webapp where you can easily find flights in the european zone, taking off from Rome.

It has been made with:
- Java, using Java Servlets as _controllers_, JavaBeans as _model_ and JavaServer Pages as _view_ (MVC pattern)
- MySQL
- HTML5 & CSS3
- Bootstrap in order to make it mobile-first and responsive
- JavaScript, jQuery and AJAX

## Deployment
Flyseum can be deployed with Maven or manually with the .war file.

### Prerequisites
- Maven
- latest JDK

### Deployment with Maven
1. Clone the repository
```bash
$ git clone https://github.com/imgios/flyseum.git
```
2. Move in `/flyseum` dir and package it with Maven:
```bash
mvn package
```
3. Deploy the project with java:
```bash
java -jar target/dependency/webapp-runner.jar target/*.war
```
4. Visit localhost and enjoy Flyseum!

## Info
- Currently, you can do the checkout only if you're logged in.
- Please, avoid accessing the database.
- In [`sql/flyseum.sql`](https://github.com/imgios/flyseum/blob/master/sql/flyseum.sql) you can find:
  - Test user
  - Test admin
  - Some test flight
- Be aware that `master branch`'s GitHub Insights aren't accurate because git counted files creation instead of movement while converting into maven.
