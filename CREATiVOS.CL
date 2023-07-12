import datetime
sp = "-----------------------------------"

entrada_platinum = 120000
entrada_gold = 80000
entrada_silver = 50000
asiento_platinum = range(1, 21)
asiento_gold = range(21, 51)
asiento_silver = range(51, 101)

lista_asientos = ['' for _ in range(100)]
asistentes = []

def mostrar_menu ():
  print()
  print(sp)
  print("PRODUCTORA CREATIVOS.CL")
  print("VENTA DE ENTRADAS PARA CONCIERTO DE MICHAEL JAM")
  print(sp)
  print("OPCIÓN 1: COMPRAR ENTRADA")
  print("OPCIÓN 2: MOSTRAR UBICACIONES DISPONIBLES")
  print("OPCIÓN 3: VER LISTADO DE ASISTENTES")
  print("OPCIÓN 4: MOSTRAR GANANCIAS TOTALES")
  print("OPCIÓN 5: SALIR")
  print(sp)
  print()

def comprar_entradas ():
  print()
  print(sp)
  print("PRECIO ENTRADAS")
  print(sp)
  print("ENTRADA PLATINUM: $120.000")
  print("ENTRADA GOLD: $80.000")
  print("ENTRADA SILVER: $50.000")
  print(sp)
  print()
  
  mostrar_ubicaciones_disponibles()
  print()
  cantidad_entradas = int(input("INGRESE LA CANTIDAD DE ENTRADAS QUE DESEA (INGRESE 0 PARA VOLVER AL MENU PRINCIPAL): "))
  if cantidad_entradas == 0:
    return

  if cantidad_entradas < 1 or cantidad_entradas > 3:
    print("SOLO PUEDE COMPRAR ENTRE 1 y 3 ENTRADAS")
    return

  for _ in range (cantidad_entradas):
    while True:
      mostrar_ubicaciones_disponibles()
      print()
      seleccion = int(input("SELECCIONE UNA UBICACIÓN: "))

      if seleccion < 1 or seleccion >100:
        print("UBICACIÓN NO VÁLIDA")
        continue

      if lista_asientos[seleccion - 1] != '':
        print("LA UBICACIÓN SELECCIONADA NO ESTA DISPONIBLE")
        continue

      run = int(input("INGRESE SU RUT (SIN PUNTOS, GUIONES NI DIGITO VERIFICADOR): "))
      if not validar_run(run):
        print("RUT INVÁLIDO")
        continue

      asistentes.append((run, seleccion))
      lista_asientos[seleccion - 1] = run
      print("OPERACIÓN REALIZADA CON EXITO")
      break

def ver_listado_asistentes():
  if not asistentes:
    print("NO HAY ASISTENTES REGISTRADOS")
    return

  asistentes_ordenados = sorted(asistentes)
  print()
  print("LISTA DE ASISTENTES")
  print()
  for asistente in asistentes_ordenados:
    print(asistente[0])
  print()

def mostrar_ubicaciones_disponibles():
  print()
  print("ESCENARIO CON ASIENTOS DISPONIBLES")
  print()
  for i in range(100):
    if (i + 1) in asiento_platinum:
      precio = entrada_platinum

    if (i + 1) in asiento_gold:
      precio = entrada_gold

    else:
      precio = entrada_silver

    if lista_asientos[i] != '':
      print("x", end='\t')
    
    else:
      print(i + 1, end='\t')
    
    if (i + 1) % 10 ==0:
      print()

def mostrar_ganancias_totales():
  cantidad_platinum = sum(1 for asiento in lista_asientos[:20] if asiento != '')
  cantidad_gold = sum(1 for asiento in lista_asientos[20:50] if asiento != '')
  cantidad_silver = sum(1 for asiento in lista_asientos[50:] if asiento != '')
  subtotal_platinum = entrada_platinum * cantidad_platinum
  subtotal_gold = entrada_gold * cantidad_gold
  subtotal_silver = entrada_silver * cantidad_silver
  total_cantidad_entradas = cantidad_platinum + cantidad_gold + cantidad_silver
  total = subtotal_platinum + subtotal_gold + subtotal_silver

  print()
  print(sp)
  print("GANANCIAS TOTALES")
  print(sp)
  print(f"ENTRADAS VIP: {cantidad_platinum} TOTAL: ${subtotal_platinum}")
  print(f"ENTRADAS VIP: {cantidad_gold} TOTAL: ${subtotal_gold}")
  print(f"ENTRADAS VIP: {cantidad_silver} TOTAL: ${subtotal_silver}")
  print(sp)
  print(f"GANANCIAS EN TOTAL")
  print(f"TOTAL ENTRADAS: {total_cantidad_entradas}\tTOTAL GANANCIAS: {total}")
  print(sp)
  print()

def salir():
  print()
  fecha_actual = datetime.datetime.now().date()
  fecha_formateada = fecha_actual.strftime("%d/%m/%Y")
  print(f"NOMBRE: {nombre}")
  print(f"APELLIDO: {apellido}")
  print(f"FECHA ACTUAL: {fecha_formateada}")  
  print("GRACIAS POR SU VISITA")

def validar_run(run):
  run = str(run)

  if len(run) < 7 or len(run) > 8:
    return False

  for c in run:
    if c.isdigit():
      return True


nombre = input("INGRESE SU NOMBRE: ")
apellido = input("INGRESE SU APELLIDO: ")

while True:
  try:
    mostrar_menu()
    op = int(input("INGRESE UNA OPCIÓN: "))
    if op == 1:
      comprar_entradas()
    elif op == 2:
      mostrar_ubicaciones_disponibles()
    elif op == 3:
      ver_listado_asistentes()
    elif op == 4:
      mostrar_ganancias_totales()
    elif op == 5:
      salir()
      break
    else:
      print("INGRESE UNA DE LAS 5 OPCIONES")
  except ValueError:
    print("INGRESE UNA OPCIÓN VÁLIDA") 
