from flask import Flask, render_template, request
from flask_mysqldb import MySQL

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'proyectoboda'
mysql = MySQL(app)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/add_contact', methods=['POST'])
def add_contact():
    if request.method == 'POST':
        nombre = request.form['nombre']
        apellido = request.form['apellido']
        telefono = request.form['telefono']
        email = request.form['email']
        contrasena = request.form['contrasena']
        ubicacion = request.form['ubicacion']
        cur = mysql.connection.cursor()
        cur.execute('INSERT INTO usuario (nombre,apellido,telefono,email,contrasena,ubicacion) VALUES (%s, %s, %s, %s, %s,%s)', (nombre,apellido,email,contrasena,telefono,ubicacion))
        mysql.connection.commit()
        return render_template ('iniciosesion.html')
    
@app.route('/login', methods=['POST'])
def login():
    email = request.form['email']
    contrasena = request.form['contrasena']
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM usuario WHERE email = %s AND contrasena = %s', (email, contrasena))
    user = cur.fetchone()
    cur.close()
    if user:
        # Inicio de sesión exitoso
        return 'Inicio de sesión exitoso'

    else:
        # Inicio de sesión fallido
        return 'Inicio de sesión fallido'
    
if __name__ == '__main__':
    app.run(port = 3000, debug = True)
