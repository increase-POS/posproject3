   M S B A M L   `   `   `  ����K  GAdministratorApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:POS.View.windowsPOS.View.windows  5   	   +    %POS.View.windows.wd_acceptCancelPopup   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   0localclr-namespace:POS.View.windows     5   	   b ^MaterialDesignThemes.Wpf, Version=4.0.0.2422, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   
   -   5          � WindowStyle$
  None=�5	   
    � WindowStartupLocation$ CenterScreen=�6    � 
ResizeMode$ NoResize=�5
   	   $��0q�6    � AllowsTransparency . 
������  � Title$ Increase-SCM��5   	   $	��175��6   $	��300��6+   .��5      ��  �� CornerRadius$	 2.5��6   
�������._�5   
   � -   5         �Name$ 	grid_main��5       � RowDefinitions 5   
   �� 5      $	��2.5 �6    �� 5      $
��2.2* �6    �� 5      $
��0.8* �6     � ColumnDefinitions 5      �� 5      $��* �6#   �� 5      $��* �6#   .+�5      �� $ 2.5,2.5,0,0��6   $��0��60   $��0��6=   $��2��6M   ���#178DD26b   �� 5      $��1��6   $��2��6%   ���#737373$
��Bold"�6m   $��14(�6�   $
��Wrap=�5      	 �� TextAlignment$	 Center=�6*   $��Center=�6B   $��Center=�6^   $��5q�5      ��5   :   �� *contentText+5      �� 5      $��2��6   $��0��6$   $ 	0,0,0,2.5��66   ���#E65B65._�5      �� -   5        
 ��Name$
 
btn_cancel��5       �� IsCancel . ��5      Z� ��63   Z� .��5       ��  �� Orientation$ 
Horizontal=�6%   $��Center=�6>   $��Center=�6[   .+�5!      �� -   5        $��
txt_cancel��5!   G   $��16(�6%   
�������$��Cancel��6Y   $��Center=�6g   '  !MaterialDesignThemes.Wpf.PackIcon  5"      -   5        $��path_cancel��5"   6      Kind$ 	CloseBold=�5#   2   $��Center=�6C   $��15��5$   2   $��15��6>   $��4,1,0,0q�6J   5&       � ToolTip 5'      _� 5(      -   5         _�Name$ 	tt_cancel��5(   &   $��Cancel��69    _� 	Placement$
 left=�5)   %    _� HorizontalOffset$ 15��5*   %    _� PlacementRectangle$ 50,0,0,0�5+   %    _� VerticalOffset$ 30��5,   %   5.      5/      �� 50      $��2��6   $��1��6"   ���#178DD2$ 	0,0,2.5,0��6H   ._�51      �� -   5        $
 btn_ok��51      ��52      Z� ��63   Z� .��54      �� $ 
Horizontal=�6!   $��Center=�6:   $��Center=�6W   .+�55      �� -   5        $��txt_ok��55   G   $��16(�6$   
�������$��OK��6U   $��Center=�6_     56      -	   5        $��path_ok��56   2   $
 Like=�57   2   $��Center=�6>   $��15��58   2   $��15��6>   $��4,1,0,0q�6J   5:       5;      _� 5<      -
   5        $ tt_ok��5<   "   $��Ok��61   $
 left=�5=   %   $ 15��5>   %   $ 50,0,0,0�5?   %   $ 30��5@   %   5B      5C      5E      5F      5H      