from flask import Flask, render_template, request, redirect, url_for, session, jsonify, make_response
from flask_mysqldb import MySQL
import json

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
        return jsonify({'success': False, 'message': 'Usuario o contraseña incorrectos'})
    
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

@app.route('/comprar', methods=['GET', 'POST'])# Crear una nueva ruta para la página de compra
def comprar():# Crear una nueva ruta para la página de compra
    if request.method == 'POST':# Verificar si el método de solicitud es POST
        if 'loggedin' in session:# Verificar si el usuario ha iniciado sesión
            usuario_id = session['id']# Obtener el ID del usuario que ha iniciado sesión
            cart = json.loads(request.form['cart'])  # Convertir el carrito de compras de JSON a un objeto de Python

            # Crear una cadena de texto con la información de los productos
            productos = "\n".join([
                f"Producto: {item['name']}, Descripción: {item['description']}, Precio: {item['price']}"
                for item in cart
            ])

            valor_total = sum([float(item['price']) for item in cart])# Calcular el valor total del carrito
            #productos = json.dumps(cart)# Convertir el carrito de compras de Python a JSON
            cur = mysql.connection.cursor()# Crear un cursor para ejecutar consultas SQL
            cur.execute('INSERT INTO carrito (usuario_id, productos, valor_total) VALUES (%s, %s, %s)',# Insertar una nueva fila en la tabla carrito 
                        (usuario_id, productos, valor_total))# con los datos del usuario, los productos y el valor total
            mysql.connection.commit()# Confirmar la transacción
            cur.close()# Cerrar el cursor
            return redirect(url_for('factura'))# Redirigir al usuario a la página de la factura
        else:
            return redirect(url_for('comprar'))# Redirigir al usuario a la página de inicio de sesión si no ha iniciado sesión
    return render_template('comprar.html')# Renderizar la plantilla de compra

@app.route('/factura')
def factura():
    if 'loggedin' in session:# Verificar si el usuario ha iniciado sesión
        usuario_id = session['id']# Obtener el ID del usuario que ha iniciado sesión
        cur = mysql.connection.cursor()# Crear un cursor para ejecutar consultas SQL
        cur.execute('SELECT * FROM carrito WHERE usuario_id = %s ORDER BY fecha_compra DESC LIMIT 1', (usuario_id,))# Obtener la última compra del usuario
        carrito = cur.fetchone()# Obtener la fila de la tabla carrito
        cur.close()# Cerrar el cursor
        return render_template('factura.html', carrito=carrito)# Renderizar la plantilla de factura con los datos de la compra
    return redirect(url_for('comprar'))

if __name__ == '__main__':
    app.run(debug = True)

