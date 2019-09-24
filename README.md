<p align="center">
  <sub>🛫</sub>
  <br/><i>FLYSEUM</i>
  <br/><sub>European flight booking website</sub>
</p>

Flyseum is a Web Development project for academic purposes. It's a little website where you can easily find flights in the european zone, taking off from Rome.

It has been made with:
- Java, using Java Servlets as _controllers_, JavaBeans as _model_ and JavaServer Pages as _view_ (MVC pattern)
- MySQL
- HTML5 & CSS3
- Bootstrap in order to make it mobile-first and responsive
- JavaScript, jQuery and AJAX

and deployed on Tomcat.

## Deployment
Here's a little how-to deploy this project.

Flyseum can be deployed on Tomcat through the IDE (I picked Eclipse) or manually with the .war file.

### Prerequisites
- latest JDK
- Apache Tomcat
- Eclipse Java EE (optional: it's necessary only if you don't want to deploy manually the .war file)

### Deployment with Eclipse Java EE
1. Clone the repository
```bash
$ git clone https://github.com/imgios/flyseum.git
```
2. Import the project inside the IDE
3. Embed Tomcat in Eclipse ([see how-to](https://help.eclipse.org/kepler/index.jsp?topic=%2Forg.eclipse.jst.server.ui.doc.user%2Ftopics%2Ftomcat.html))
4. Publish the project on Tomcat and click on run

### Deployment with .WAR
The final .war file isn't available yet, but it will be soon.

<details><summary markdown="span"><strong>Workaround</strong></summary>

1. Clone the repository
```bash
$ git clone https://github.com/imgios/flyseum.git
```
2. Import the project inside the IDE
3. Export as Web Archive (WAR)
4. Drop the .WAR file into the $CATALINA_HOME\webapps directory of your Tomcat server
5. Start the server and visit localhost:8080/Flyseum

</details>
