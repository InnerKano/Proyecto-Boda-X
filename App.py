from flask import Flask 
from flask_mysqldb import MySQL
from flask import Flask, render_template

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'Alguito.com1'
app.config['MYSQL_DB'] = 'proyectoboda'
mysql = MySQL(app)

mysql = MySQL()

@app.route('/')
def index():
    return render_template('views/registrarusuario.html')
    
if __name__ == '__main__':
    app.run(port = 3000, debug = True)

