   M S B A M L   `   `   `  ����M  IProyectoPlantasGUI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:ProyectoPlantasGUIProyectoPlantasGUI  5   	   *    $ProyectoPlantasGUI.Ventana_Principal   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   2local clr-namespace:ProyectoPlantasGUI     5   	   -   5          � Title$"  El Salto - Ventana Principal��5   	   $	��550��6.   $
��1100��6;   .��5	      � .+�5
   
   ]� ��.  .+�5      o� -   5         o�Name$ menuPrincipal��5   S    o� 
IsMainMenu . $	��Top=�6%   $��20��6:   $
��Auto��6F   $��0,0,0,10q�6j   .@�5      m� $��Menú de Opciones��6   .@�5      m� -   5         m�Name$ optAgregarNuevaPlanta��5   =   $��Agregar Nueva Planta��6   6\   m� 5      -   5        $ optListarPlantas��5   7   $��Listar Plantas��6   6Q   5      5      &   System.Windows.Controls.DataGrid  5      -   5          Name$ dgListadoPlantas��5      $
��Auto��61   $
��Auto��6>   $��	0,40,0,40q�6L   $	��Top=�6_   {�.     CanUserAddRows .  6�   5      �� 5   
   -   5         ��Name$ lblBienvenida��5      $�� ��6'   $
��Left=�62   $��
50,450,0,0q�6M   $	��Top=�6a   6{   5      5      