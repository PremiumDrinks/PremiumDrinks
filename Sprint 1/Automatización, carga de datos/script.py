import time
import os
import pandas as pd
from sqlalchemy import create_engine
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

class FileHandler(FileSystemEventHandler):
    def on_created(self, event):
        # Llama al script de carga cuando se detecta un nuevo archivo CSV
        if event.src_path.endswith('.csv'):
            print(f'Nuevo archivo encontrado: {event.src_path}')
            cargar_datos_a_sql(event.src_path)

def cargar_datos_a_sql(csv_file):
    # Configuración de la conexión a SQL Server usando SQLAlchemy
    server = r'DESKTOP-5Q8KF0G\SQLEXPRESS'  # Cambia por tu servidor SQL
    database = 'PremiumDrinks' 
    connection_string = f'mssql+pyodbc://{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server'
    
    conn = None  # Inicializamos la variable conn fuera del try

    try:
        engine = create_engine(connection_string)
        conn = engine.connect()

        # Ruta para mover archivos procesados
        processed_folder = r'C:\Users\Mati puto\Downloads\data set pf\data set limpios(compañeras)\limpios para sql\data\processed'


        # Diccionario que mapea nombres de archivo a tablas
        file_to_table_map = {
            'new_2017PurchasePricesDec.csv': 'PrecioCompra',
            'new_BegInvFINAL12312016.csv': 'InventarioInicial',
            'new_EndInvFINAL12312016.csv': 'InventarioFinal',
            'new_InvoicePurchases12312016.csv': 'FacturasCompras2016',
            'new_PurchasesFINAL12312016.csv': 'Compras2016',
            'new_SalesFINAL12312016.csv': 'Ventas2016'
        }

        # Leer el archivo CSV en un DataFrame de pandas
        df = pd.read_csv(csv_file)

        # Determinar la tabla de destino
        base_filename = os.path.basename(csv_file)
        table_name = file_to_table_map.get(base_filename)
        
        if not table_name:
            print(f"No hay una tabla mapeada para el archivo {base_filename}.")
            return

        # Cargar el DataFrame a SQL Server
        df.to_sql(table_name, conn, if_exists='append', index=False)
        print(f"Datos cargados desde {csv_file} a la tabla {table_name}.")
        
        # Mover archivo procesado a la carpeta de procesados
        os.rename(csv_file, os.path.join(processed_folder, base_filename))
        
    except Exception as e:
        print(f"Ocurrió un error procesando {csv_file}: {e}")
    finally:
        if conn:  # Verifica si conn fue asignado antes de cerrar
            conn.close()
            print("Conexión cerrada.")

if __name__ == "__main__":
    event_handler = FileHandler()
    observer = Observer()
    observer.schedule(event_handler, path=r'C:\Users\Mati puto\Downloads\data set pf\data set limpios(compañeras)\limpios para sql\data\new_data', recursive=False)
    observer.start()
    
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()