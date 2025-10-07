# 🏃‍♂️ Sports Store App

Una aplicación móvil desarrollada en Flutter para la gestión y visualización de productos deportivos. Cuenta con una interfaz moderna y atractiva con animaciones fluidas y un sistema de navegación intuitivo.

## 📱 Características

### ✨ Funcionalidades Principales

- **Pantalla de Bienvenida Animada**: Introducción visual con animaciones de fade y scale
- **Sistema de Login**: Interfaz elegante para autenticación de usuarios
- **Menú Principal**: Navegación centralizada a todas las secciones
- **Catálogo de Productos**: Visualización de productos con filtrado por categorías
- **Gestión de Productos**: Formulario para agregar nuevos productos al catálogo
- **Confirmación de Cierre de Sesión**: Diálogo de seguridad antes de cerrar sesión

### 🎨 Características de Diseño

- **Paleta de Colores Consistente**: Gradientes morado-rosado en toda la aplicación
- **Diseño Responsivo**: Adaptable a diferentes tamaños de pantalla
- **Iconografía Dinámica**: Íconos específicos según el tipo de producto
- **Animaciones Suaves**: Transiciones y efectos visuales atractivos
- **UI Moderna**: Cards con gradientes, sombras y bordes redondeados

## 🗂️ Categorías de Productos

La aplicación maneja las siguientes categorías:

- ⚽ Balones
- 👕 Polos
- 👔 Camisetas
- 👖 Pantalones
- 👟 Zapatillas
- 🧤 Accesorios
- 🎾 Raquetas
- 🚴 Bicicletas

## 🚀 Instalación

### Prerrequisitos

- Flutter SDK (versión 3.0 o superior)
- Dart SDK
- Android Studio / VS Code con extensiones de Flutter
- Emulador Android o dispositivo físico

### Pasos de Instalación

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/Anjelisahori/LAB8-MULTIPLATAFORMA.git
   cd LAB8-MULTIPLATAFORMA
   ```

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

3. **Verificar dispositivos disponibles**
   ```bash
   flutter devices
   ```

4. **Ejecutar la aplicación**
   ```bash
   flutter run
   ```

## 📂 Estructura del Proyecto

```
lib/
├── main.dart                 # Archivo principal de la aplicación
│   ├── MyApp                 # Widget principal con configuración de rutas
│   ├── WelcomePage          # Pantalla de bienvenida animada
│   ├── LoginPage            # Pantalla de inicio de sesión
│   ├── MenuPage             # Menú principal de navegación
│   ├── HomePage             # Catálogo de productos con filtros
│   ├── SettingsPage         # Formulario de registro de productos
│   └── Product              # Modelo de datos de producto
```

## 🛠️ Tecnologías Utilizadas

- **Flutter**: Framework de desarrollo multiplataforma
- **Dart**: Lenguaje de programación
- **Material Design**: Sistema de diseño de Google

## 📱 Pantallas de la Aplicación

### 1. Welcome Page
Pantalla de bienvenida con animaciones de entrada y redirección automática al login después de 3 segundos.

### 2. Login Page
Formulario de autenticación con campos para email y contraseña.

### 3. Menu Page
Menú principal con opciones para:
- Ver productos (Home)
- Perfil de usuario
- Configuración/Agregar productos
- Cerrar sesión (con confirmación)

### 4. Home Page
Catálogo de productos con:
- Grid horizontal de categorías
- Lista de productos filtrable
- Información detallada: nombre, categoría y precio
- Iconografía dinámica según tipo de producto

### 5. Settings Page
Formulario para agregar nuevos productos con:
- Campo de nombre del producto
- Selector de categoría (dropdown)
- Campo de precio
- Validación de campos
- Confirmación de registro exitoso

## 🎨 Paleta de Colores

```dart
Gradiente Principal:
- Color(0xFF2D1B3D) - Morado oscuro
- Color(0xFF8B4F6F) - Rosa medio
- Color(0xFFD17B7B) - Rosa claro

Acentos:
- Color(0xFFFF9A76) - Naranja coral
- Color(0xFFFF7B7B) - Rosa coral
- Color(0xFFE86B6B) - Rojo suave
```

## 🔄 Flujo de Navegación

```
WelcomePage (3s) → LoginPage → MenuPage
                                   ├─→ HomePage
                                   ├─→ Profile (Próximamente)
                                   ├─→ SettingsPage → MenuPage
                                   └─→ Logout Dialog → LoginPage
```

## 📝 Lista de Productos Predefinidos

La aplicación incluye 9 productos de ejemplo:

1. Balón Nike Premier League - $89.99
2. Zapatillas Adidas Predator - $199.99
3. Guantes de Portero Puma - $45.50
4. Camiseta Manchester United - $75.00
5. Raqueta Wilson Pro Staff - $249.99
6. Bicicleta Trek Mountain - $1,299.00
7. Polo Deportivo Nike - $45.00
8. Pantalón Adidas Training - $65.00
9. Short Puma Running - $35.00



