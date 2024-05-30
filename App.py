from flask import Flask, render_template, request, redirect, url_for, session, jsonify, make_response
from flask_mysqldb import MySQL

app = Flask(__name__)
app.secret_key = 'your_secret_key'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'proyecto boda x'
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
        cur.execute('INSERT INTO usuario (nombre,apellido,email,contrasena,telefono,ubicacion) VALUES (%s, %s, %s, %s, %s,%s)', 
                    (nombre, apellido, email, contrasena, telefono, ubicacion))
        mysql.connection.commit()
        cur.close()
        # Return a minimal response
        return redirect(url_for('index'))

@app.route('/login', methods=['POST'])
def login():
    email = request.form['email']
    contrasena = request.form['contrasena']
    cur = mysql.connection.cursor()
    cur.execute('SELECT * FROM usuario WHERE email = %s AND contrasena = %s', (email, contrasena))
    user = cur.fetchone()
    cur.close()
    if user:
        session['loggedin'] = True
        session['id'] = user[0]
        session['email'] = user[3]
        return jsonify({'success': True})
    else:
        return jsonify({'success': False, 'message': 'Login failed'})
    
@app.route('/logout')
def logout():
    """
    Ruta para cerrar la sesión del usuario.
    Elimina la información de sesión.
    """
    session.pop('loggedin', None)
    session.pop('id', None)
    session.pop('email', None)
    return redirect(url_for('index'))

@app.route('/usuario')
def usuario():
    if 'loggedin' in session:
        user_id = session['id']
        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM usuario WHERE id = %s', (user_id,))
        user = cur.fetchone()
        cur.close()
        return render_template('usuario.html', user=user)
    return jsonify({'success': False, 'message': 'User not logged in'})
    
@app.route('/check_login_status')
def check_login_status():
    """
    Ruta para verificar el estado de inicio de sesión del usuario.
    Devuelve el estado de autenticación del usuario.
    """
    if 'loggedin' in session:
        return jsonify({'loggedin': True})
    else:
        return jsonify({'loggedin': False})

@app.route('/miboda')
def miboda():
    cur = mysql.connection.cursor()
    
    # Consultas para cada sección del servicio 1: Boda/Ceremonia
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 1 AND Seccion_ID = 1")
    anillo_de_boda = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 1 AND Seccion_ID = 2")
    carro_de_matrimonio = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 1 AND Seccion_ID = 3")
    catering_banquete = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 1 AND Seccion_ID = 4")
    decoracion_mesa = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 1 AND Seccion_ID = 5")
    lugar_ceremonia = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 1 AND Seccion_ID = 6")
    mesa_regalos = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 1 AND Seccion_ID = 7")
    musica = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 1 AND Seccion_ID = 8")
    pastel_boda = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 1 AND Seccion_ID = 9")
    sesion_fotografica = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 1 AND Seccion_ID = 10")
    tipo_invitaciones = cur.fetchall()
    
    # Consultas para cada sección del servicio 2: Luna de Miel
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 2 AND Seccion_ID = 1")
    isla_maldivas = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 2 AND Seccion_ID = 2")
    marruecos = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 2 AND Seccion_ID = 3")
    mykonos = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 2 AND Seccion_ID = 4")
    santorini = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 2 AND Seccion_ID = 5")
    venecia = cur.fetchall()
    
    # Consultas para cada sección del servicio 3: Novia
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 3 AND Seccion_ID = 1")
    flores_novia = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 3 AND Seccion_ID = 2")
    joyeria = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 3 AND Seccion_ID = 3")
    peinados = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 3 AND Seccion_ID = 4")
    vestido_fiesta = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 3 AND Seccion_ID = 5")
    vestido_novia = cur.fetchall()
    
    # Consultas para cada sección del servicio 4: Novio
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 4 AND Seccion_ID = 1")
    accesorios_novio = cur.fetchall()
    
    cur.execute("SELECT * FROM opcionesservicios WHERE Servicios_ID = 4 AND Seccion_ID = 2")
    traje_novio = cur.fetchall()
    
    cur.close()
    
    return render_template('mi_boda.html', 
                           anillo_de_boda=anillo_de_boda, 
                           carro_de_matrimonio=carro_de_matrimonio, 
                           catering_banquete=catering_banquete,
                           decoracion_mesa=decoracion_mesa,
                           lugar_ceremonia=lugar_ceremonia,
                           mesa_regalos=mesa_regalos,
                           musica=musica,
                           pastel_boda=pastel_boda,
                           sesion_fotografica=sesion_fotografica,
                           tipo_invitaciones=tipo_invitaciones,
                           isla_maldivas=isla_maldivas,
                           marruecos=marruecos,
                           mykonos=mykonos,
                           santorini=santorini,
                           venecia=venecia,
                           flores_novia=flores_novia,
                           joyeria=joyeria,
                           peinados=peinados,
                           vestido_fiesta=vestido_fiesta,
                           vestido_novia=vestido_novia,
                           accesorios_novio=accesorios_novio,
                           traje_novio=traje_novio,
                           str=str #str es una función de python que convierte un objeto en una cadena de texto
                           )


@app.route('/acercade')
def acercade():
    return render_template('acerca_de.html')

""" pruebas """
@app.route('/iniciosesion')
def iniciosesion():
    return render_template('iniciosesion.html')


@app.route('/registrarusuario')
def registrarusuario():
    return render_template('registrarusuario.html')

@app.route('/carrito')
def carrito():
    return render_template('carrito.html')



if __name__ == '__main__':
    app.run(port = 3000, debug = True)

