   M S B A M L   `   `   `  ����K  GAdministratorApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullI)clr-namespace:AdministratorApp.View.salesAdministratorApp.View.sales  5      *    $AdministratorApp.View.sales.uc_sales   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ;local)clr-namespace:AdministratorApp.View.sales     5      b ^MaterialDesignThemes.Wpf, Version=4.0.0.2422, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5      -   5        .��5
      � -   5          �Name$  grid_mainGrid��5
       � RowDefinitions 5   
   �� 5      $	��125 �6   �� 5      $��* �6   .+�5   
   � $��
10,0,360,0q�6    � ColumnDefinitions 5      �� 5      $��* �6#   �� 5      $��* �6#   .+�5      �� -   5         ��Name$ btn_sale��5      $��0��5         	MainColor#��[  5      $
��Book��5      $
��Bold"�6&   $��5q�6;   +  %MaterialDesignThemes.Wpf.ButtonAssist   CornerRadius$ 10��6F   
 � Tag$
 book��5   @   ��5   ?   Z� 5   @   �� 5      -   5        $ btn_packageUser��5      $��1��5        SecondColor#��[ 5      $��Payments��5      $
��Bold"�6*   $��5q�6A   $ 10��6L   $ payments��5   O   ��5   A   Z� 5   O   �� 5      -   5        $ btn_posSerials��5!      $��2��5      $y�	Collapsed=�6'   #��[ 5      $��Serials��5       $
��Bold"�6$   $��5q�6;   $ 10��6F   $ 
posSerials��5!   M   ��5   8   Z� 5!   M   5#      � 5$   
   -   5        $  	grid_main��5$      $��1��6   6   5%      5&      