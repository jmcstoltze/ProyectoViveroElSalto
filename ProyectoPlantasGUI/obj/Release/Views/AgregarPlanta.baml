   M S B A M L   `   `   `  ���� M  IProyectoPlantasGUI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullC&clr-namespace:ProyectoPlantasGUI.ViewsProyectoPlantasGUI.Views  ,    &ProyectoPlantasGUI.Views.AgregarPlanta   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     8local&clr-namespace:ProyectoPlantasGUI.Views       � Title$  El Salto - Agregar Planta��$	��550��$
��1100��.��� .+��� -    ��Name$ lblNombreComun��$��Nombre Común��$
��Left=�$��	60,60,0,0q�$	��Top=��� -   $ lblNombreCientifico��$��Nombre Científico��$
��Left=�$��	60,90,0,0q�$	��Top=��� -   $ lblTipoPlanta��$��Tipo de planta��$
��Left=�$��
60,120,0,0q�$	��Top=��� -   $ lblDescripcion��$��Descripción��$
��Left=�$��
60,150,0,0q�$	��Top=��� -   $ lblTiempoRiego��$��Tiempo de riego��$
��Left=�$��
60,180,0,0q�$	��Top=��� -   $ lblCantidadAgua��$��Cantidad de agua��$
��Left=�$��
60,210,0,0q�$	��Top=��� -   $ lblEpoca��$��Ingrese época��$
��Left=�$��
60,240,0,0q�$	��Top=��� -   $ lblEsVenenosa��$��Es Venenosa��$
��Left=�$��
60,270,0,0q�$	��Top=��� -	   $ lblEsAutoctona��$��Es Autóctona��$
��Left=�$��
60,300,0,0q�$	��Top=��� -
    ��Name$ txtNombreComun��$
��Left=�$��
230,64,0,0q� �� TextWrapping$
 Wrap=�$	��Top=�$	��400�� �� 	MaxLength$	 101������ *NombreComun+ �� UpdateSourceTrigger$ PropertyChanged=� �� ValidatesOnDataErrors .  � ToolTip �� *ErrorCollection[NombreComun]+�� -   $ txtNombreCientifico��$
��Left=�$��
230,94,0,0q�$
 Wrap=�$	��Top=�$	��400��$	 151������ *NombreCientifico+$ PropertyChanged=� .  �� *#!ErrorCollection[NombreCientifico]+�� -    ��Name$ cmbTipoPlanta��$
��Left=�$��230,124,0,0q�$	��Top=�$	��400��	 �� SelectedIndex$	 0��.@��� $��Seleccionar��
 �� 
IsSelected
 . {�.  �� $��	Herbácea���� $��Matorral���� $��Arbusto���� $��Árbol���� -   $ txtDescripcion��$
��Left=�$��230,154,0,0q�$
 Wrap=�$	��Top=�$	��400���� -   $ txtTiempoRiego��$
��Left=�$�� 230, 184, 0,0q�$
 Wrap=�$	��Top=�$	��400��$ 60������ *TiempoRiego+$ PropertyChanged=� .  �� *ErrorCollection[TiempoRiego]+�� -   $ txtCantidadAgua��$
��Left=�$�� 230, 214, 0,0q�$
 Wrap=�$	��Top=�$	��400��$ 60������ *CantidadAgua+$ PropertyChanged=� .  �� *ErrorCollection[CantidadAgua]+�� -   $ cmbEpoca��$
��Left=�$��230,244,0,0q�$	��Top=�$	��400��$	 0��.@��� $��Seleccionar��
 . {�.  �� $��Otoño���� $��Invierno���� $��	Primavera���� $��Verano���� -    ��Name$ chkEsVenenosa��$	��Sí��$
��Left=�$��230, 276, 0, 0q�$	��Top=��� -   $ chkEsAutoctona��$	��Sí��$
��Left=�$��230, 306, 0, 0q�$	��Top=��� -    ��Name$ btnAgregarPlanta��$��Agregar Planta��$
��Left=�$��230,350,0,0q�$	��120��$	��Top=�����  �� 
TargetType" ��.���  �� Property � {� �� Value .   �� Triggers ^�  ^� 
Conditions ��  �� Binding ��  �� ElementName$ txtNombreComun�� �� Path$ (Validation.HasError)� �� Value	 False��  �� $ txtNombreCientifico��$ (Validation.HasError)�	 False��  �� $ txtTiempoRiego��$ (Validation.HasError)�	 False��  �� $ txtCantidadAgua��$ (Validation.HasError)�	 False.0���  � {� . 