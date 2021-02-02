// Required imports
import 'package:flutter/material.dart';
// Widget
class InputsPage extends StatefulWidget {

  // State builder
  @override
  State<StatefulWidget> createState() {
    return _WidgetState();
  }
}

// State
class _WidgetState extends State<InputsPage> {

  // Variables
  String _email = '';
  String _name = '';
  String _password = '';
  String date = '';
  /* 'TextEditingController' es una interface que permite controlar de forma
   * dinámica el valor de un TextField. Al actualizarse el controlador, llama
   * al listener del input asociado y de esa forma actualiza su valor también
   */
  TextEditingController _datepickerController = TextEditingController();
  
  String selectedOption;
  List<String> options = [
      'Opción 1',
      'Opción 2',
      'Opción 3',
      'Opción 4'
    ];

  // Widget builder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs')
      ),
      /* En una vista con inputs, es normal contener el 'body' en un ListView,
       * ya que en un Input de texto, el usuario despliega el teclado en la
       * pantalla y esto tiende a subir el contenido hacia arriba.
       */
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 15.0
        ),
        children: [
          _nameInputTextBuilder(),
          _emailInputTextBuilder(),
          _passwordInputTextBuilder(),
          Divider(),
          ListTile(
            title: Text('Tu nombre es: $_name'),
          ),
          ListTile(
            title: Text('Tu email es: $_email'),
          ),
          Divider(),
          _datepickerBuilder(),
          Divider(),
          _dropdownBuilder()
        ]
      )
    );
  }

  // Método que crea un input text para introducir el nombre
  Widget _nameInputTextBuilder() {
    /* TextField está pensado como un Widget independiente.
     * TextFormField está pensado para trabajar dentro de un formulario (Form)
     */
    return TextField(
      // 'autofocus' asigna el foco al input automáticamente al renderizar el Widget
      autofocus: true,
      /* 'textCapitalization' coloca en mayúsculas los valores del input según
       * la configuración deseada (por letra, por sentencia, etc)
       */ 
      textCapitalization: TextCapitalization.sentences,
      // Es un tipo especial de Widget similar a BoxDecoration
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        counter: Text('${_name.length} / 30'),
        labelText: 'Nombre completo',
        hintText: 'Fulanito de Tal',
        icon: Icon(Icons.account_circle_outlined),
        suffixIcon: Icon(Icons.info_outline)
      ),
      /* 'onChanged' dispara una función por cada cambio en el valor que se
       * detecte en el input
       */
      onChanged: (inputValue) {
        setState(() {
          this._name = inputValue;
        });
      }
    );
  }

  // Método que crea un input text para introducir el email
  Widget _emailInputTextBuilder() {
    return TextField(
      /* 'keyboardType' define el tipo de despliegue del input text en cuanto
       * al teclado. Por ejemplo, en 'number', despliega el teclado solo para
       * números, en 'emailAddress' despliega para correo electrónico, etc.
       */
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        labelText: 'Correo electrónico',
        labelStyle: TextStyle(
          color: Colors.green
        ),
        hintText: 'example@pssatech.com',
        helperText: 'Introduce un email válido.',
        icon: Icon(Icons.email_outlined),
        suffixIcon: Icon(Icons.info_outline)
      ),
      onChanged: (inputValue) {
        setState(() {
          this._email = inputValue;
        });
      }
    );
  }

  // Método que crea un input text para introducir la contraseña
  Widget _passwordInputTextBuilder() {
    return TextField(
      // 'obscureText' permite ocultar los caracteres escritos en el input
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        labelText: 'Contraseña',
        icon: Icon(Icons.vpn_key_outlined)
      ),
      onChanged: (inputValue) {
        setState(() {
          this._password = inputValue;
          print(_password);
        });
      }
    );
  }

  // Método que crea un input para introducir una fecha
  Widget _datepickerBuilder() {
    return TextField(
      /* 'enableInteractiveSelection' impide seleccionar o colocar el cursor
       * del móvil sobre el TextField
       */
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        labelText: 'Fecha',
        suffixIcon: Icon(Icons.event_outlined)
      ),
      onTap: () {
        /* La siguiente sentencia permite que al hacer click sobre el input,
         * este no le asigne el foco y así completar la ilusión de estar
         * abriendo un date picker
         */
        FocusScope.of(context).requestFocus(new FocusNode());
        _openDatetimePicker();
      },
      // Controlador dinámico del valor del input
      controller: _datepickerController,
    );
  }

  // Método para abrir el Widget del date picker
  void _openDatetimePicker() async {
    /* Este método ocupa el BuildContext, pero Flutter permite inferirlo
     * automáticamente
     */
    final DateTime pickedDate = await showDatePicker(
      context: context,
      // 'initialDate' posiciona el date picker en la fecha indicada
      initialDate: DateTime.now(),
      // 'firstDate' restringe el date picker no más antes de la fecha indicada
      firstDate: DateTime.parse('2019-12-31 15:00:00'),
      // 'lastDate' restringe el date picker no más después de la fecha indicada
      lastDate: DateTime.parse('2025-01-01 21:00:00'),
      /* 'locale' permite configurar el idioma del date picker. Para que Flutter
       * lo reconozca, se debe modificar el pubspec.yaml para este propósito,
       * además de
       */
      // locale: Locale('es', 'ES')
    );

    // Validando que se haya seleccionado una fecha
    if (pickedDate != null) {
      setState(() {
        // Guardando en una varibale la fecha seleccionada
        this.date = pickedDate.toString();
        // Actulizando el controlador del TextField
        this._datepickerController.text = date;
      });
    }
  }

  // Método para crear un widget tipo dropdown button
  Widget _dropdownBuilder() {

    // Ordenando items del dropdown
    final List<DropdownMenuItem<String>> dropdownOptions = options.map((option) {
      return DropdownMenuItem(
        child: Text(option),
        value: option
      );
    }).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.settings_outlined,
          color: Colors.deepPurpleAccent
        ),
        SizedBox(
          width: 14.0
        ),
        Container(
          child: DropdownButton(
            underline: Container(
              height: 2.1,
              color: Colors.deepPurpleAccent
            ),
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 16.5
            ),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.deepPurpleAccent,
            ),
            hint: Text('Seleccionar opción'),
            items: dropdownOptions,
            value: selectedOption,
            onChanged: (option) {
              setState(() {
                this.selectedOption = option;
              });
            },
          )
        )
      ]
    );
  }
}