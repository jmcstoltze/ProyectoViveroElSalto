   M S B A M L   `   `   `  ����M  IProyectoPlantasGUI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullC&clr-namespace:ProyectoPlantasGUI.ViewsProyectoPlantasGUI.Views  5   	   ,    &ProyectoPlantasGUI.Views.AgregarPlanta   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   8local&clr-namespace:ProyectoPlantasGUI.Views     5   	     � Title$  El Salto - Agregar Planta��5   	   $	��550��6+   $
��1100��68   .��5	      � .+�5
   
   �� -   5         ��Name$ lblNombreComun��5
      $��Nombre Común��6(   $
��Left=�6?   $��	60,60,0,0q�6Z   $	��Top=�6m   �� 5   
   -   5        $ lblNombreCientifico��5      $��Nombre Científico��6-   $
��Left=�6I   $��	60,90,0,0q�6d   $	��Top=�6w   �� 5   
   -   5        $ lblTipoPlanta��5      $��Tipo de planta��6'   $
��Left=�6@   $��
60,120,0,0q�6[   $	��Top=�6o   �� 5   
   -   5        $ lblDescripcion��5      $��Descripción��6(   $
��Left=�6>   $��
60,150,0,0q�6Y   $	��Top=�6m   �� 5   
   -   5        $ lblTiempoRiego��5      $��Tiempo de riego��6(   $
��Left=�6B   $��
60,180,0,0q�6]   $	��Top=�6q   �� 5   
   -   5        $ lblCantidadAgua��5      $��Cantidad de agua��6)   $
��Left=�6D   $��
60,210,0,0q�6_   $	��Top=�6s   �� 5   
   -   5        $ lblEpoca��5      $��Ingrese época��6"   $
��Left=�6:   $��
60,240,0,0q�6U   $	��Top=�6i   �� 5   
   -   5        $ lblEsVenenosa��5      $��Es Venenosa��6'   $
��Left=�6=   $��
60,270,0,0q�6X   $	��Top=�6l   �� 5   
   -	   5        $ lblEsAutoctona��5      $��Es Autóctona��6(   $
��Left=�6?   $��
60,300,0,0q�6Z   $	��Top=�6n   �� 5   
   -
   5         ��Name$ txtNombreComun��5      $
��Left=�6*   $��
230,64,0,0q�6E    �� TextWrapping$
 Wrap=�6Y   $	��Top=�6m   $	��400��6�    �� 	MaxLength$	 101��5      ��5      �� *NombreComun+ �� UpdateSourceTrigger$ PropertyChanged=� �� ValidatesOnDataErrors .  � ToolTip 5      �� *ErrorCollection[NombreComun]+�� 5   
   -   5        $ txtNombreCientifico��5      $
��Left=�6/   $��
230,94,0,0q�6J   $
 Wrap=�6^   $	��Top=�6r   $	��400��6�   $	 151��5      ��5      �� *NombreCientifico+$ PropertyChanged=� .  5      �� *#!ErrorCollection[NombreCientifico]+�� 5   
   -   5         ��Name$ cmbTipoPlanta��5      $
��Left=�6*   $��230,124,0,0q�6E   $	��Top=�6Z   $	��400��6r   	 �� SelectedIndex$	 0��6~   .@�5       �� $��Seleccionar��6   
 �� 
IsSelected
 . {�.  6C   �� 5!      $��	Herbácea��6   �� 5"      $��Matorral��6   �� 5#      $��Arbusto��6   �� 5$      $��Árbol��6   5%      �� 5'   
   -   5        $ txtDescripcion��5'      $
��Left=�6*   $��230,154,0,0q�6E   $
 Wrap=�6Z   $	��Top=�6n   $	��400��6�   �� 5(   
   -   5        $ txtTiempoRiego��5(      $
��Left=�6*   $�� 230, 184, 0,0q�6E   $
 Wrap=�6]   $	��Top=�6q   $	��400��6�   $ 60��5*      ��5)      �� *TiempoRiego+$ PropertyChanged=� .  5+      �� *ErrorCollection[TiempoRiego]+�� 5-   
   -   5        $ txtCantidadAgua��5-      $
��Left=�6+   $�� 230, 214, 0,0q�6F   $
 Wrap=�6^   $	��Top=�6r   $	��400��6�   $ 60��5/      ��5.      �� *CantidadAgua+$ PropertyChanged=� .  50      �� *ErrorCollection[CantidadAgua]+�� 53   
   -   5        $ cmbEpoca��53      $
��Left=�6%   $��230,244,0,0q�6@   $	��Top=�6U   $	��400��6m   $	 0��6y   .@�54      �� $��Seleccionar��6   
 . {�.  6C   �� 55      $��Otoño��6   �� 56      $��Invierno��6   �� 57      $��	Primavera��6   �� 58      $��Verano��6   59      �� 5;   
   -   5         ��Name$ chkEsVenenosa��5;      $	��Sí��6*   $
��Left=�67   $��230, 276, 0, 0q�6R   $	��Top=�6j   �� 5<   
   -   5        $ chkEsAutoctona��5<      $	��Sí��6+   $
��Left=�68   $��230, 306, 0, 0q�6S   $	��Top=�6k   �� 5>   
   -   5         ��Name$ btnAgregarPlanta��5>      $��Agregar Planta��6+   $
��Left=�6D   $��230,350,0,0q�6_   $	��120��6t   $	��Top=�6�   ��5?      �� 5@       �� 
TargetType" ��6   .�5A      ��  �� Property � {� �� Value .  62    �� Triggers 5B      ^� 5C       ^� 
Conditions 5D      �� 5E   "    �� Binding 6,   ��  �� ElementName$ txtNombreComun�� �� Path$ (Validation.HasError)� �� Value	 False6w   �� 5F   "    6,   �� $ txtNombreCientifico��$ (Validation.HasError)�	 False6|   �� 5G   "    6,   �� $ txtTiempoRiego��$ (Validation.HasError)�	 False6w   �� 5H   "    6,   �� $ txtCantidadAgua��$ (Validation.HasError)�	 False6x   .0�5N      ��  � {� . 6:   5O      5Q      5S      5T      5U      