   M S B A M L   `   `   `  ����K  GAdministratorApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullM+clr-namespace:AdministratorApp.View.windowsAdministratorApp.View.windows  5   	   1    +AdministratorApp.View.windows.wd_seialsList   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   =local+clr-namespace:AdministratorApp.View.windows     5   	   b ^MaterialDesignThemes.Wpf, Version=4.0.0.2422, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5   	   -   5          � WindowStyle$
  None=�5	   	    � WindowStartupLocation$ CenterScreen=�6    � 
ResizeMode$ NoResize=�5
   	   $��0q�6   $	��550��6*   $	��500��67    � Title$ Increase-SCM��5      
������  � AllowsTransparency . .��5      � -   5         �Name$ grid_serialsList��5       � RowDefinitions 5   
   �� 5      $��40 �6   �� 5      $��* �6   .+�5   
   � .+�5      �� $��0q�6   $��0��6*    �� CornerRadius$ 7,7,0,0��5      ���#178DD2._�5      � .+�5      �� -   5         ��Name$ 	btn_colse��5   Y   	 �� IsCancel	 . $��Right=�5   0   $��Center=�6L   
�������$��7.5,0q�5   I   $��SemiBold"�5      $��24��64   $��0q�6?   $��14(�6L   ��5   g   Z� ��5      Z� .��5      '  !MaterialDesignThemes.Wpf.PackIcon  
�������
   Kind$
 Close=�6E   $��20��5   2   $��20��6=    � ToolTip 5      _� 5      -   5         _�Name$ tt_close��5   &    _� 	Placement$
 left=�5    %    _� HorizontalOffset$ 15��5!   %    _� PlacementRectangle$ 50,0,0,0�5"   %    _� VerticalOffset$ 30��5#   %   5%      � 5&      $	��360��6   $��30��6'   $��Center=�63    � ColumnDefinitions 5'      �� 5(      $��* �6/   �� 5)      $
��1.2* �6/   .+�5+      F� 
������� �� Stretch$
 Fill=�6,   $	��5,0q�6;   $��LeftToRight=�6H   $��Right=�5,      $��0��6;   $��Center=�5-      $��20��6:   $��20��6E   �����@[l Ǡ�@[l�H+�5F � ��43333�V@S  �������T@@��ō`�gffffFQ@S`Js    �P@ �743333�O@���    @O@S@-�43333�N@���    �N@���    �N@S��    �N@ �b    �N@������n@    �N@S ������̌N@������n@gffff�N@ ��gffff�N@�����In@gfffffO@ �I43333�P@ �I@zA� �I`c1 �I�L! �I�5
� �I��= �I�gj �I �� �I`N�@^] ��������S Z�43333sm@`=�  ��43333�m@S�z'43333�m@�����|t@43333�m@`��43333�m@�����w@    �m@�����w@� ����@�G�d@[l�$�@[lgfffffl@�@[l H<��j@��@[l Ǡ�  ��@�	�r ��e q��� �O@���ǆ��� L�@��S���gffff�V@gffff�t@ ec�N9gffff�V@S��q43333�V@@H����@H�43333X@S ;�    �Y@@H������l[@@H�43333]@S@H�43333�^@@H�gffffF`@@H�gffff&a@S@H�    �a@��z��m 2P    �a@S`A643333�a@`�43333�a@��43333�a@S ��43333�a@�������̌a@���43333a@S���43333C`@���������^@��������L]@S���hfffff\@ �    �[@ zW�����\@S �C�����,\@�T1�����L\@`~    `\@������s@    �\@������s@433333\@������s@����̬[@�@j��\�w���/  �������qp@�\S���gffffFY@�� y�43333q@���S��tgffff�V@����̄q@ �o    �q@�-t������Dr@�U}������r@�^�gffff�r@@�)� �`ln@O	`��gffff�r@`� �gffff�r@@P643333�r@`�ngffff�r@����    �r@ � ϰ� R`�M��v�gffff�q@�6�gffff�q@`����k`S{����U^fffff�p@ �" �� ���fffffVp@�3M �@�������qp@�\�@�����S �������i@�U���v��d�;����" G�gffff�q@�a�`���,�S /*�����|j@��������	j@�D������)i@S ������)h@ ���	�������f@S@��������d@��.�����9d@@��233333d@S@4R�����/d@�b�����̬d@@��effff�e@S�' �����<f@������r@������f@�������yg@S@O	�����yg@�\�����yg@ ������|g@�`���n�' ���@��������`�S�i������ii@gffff�u@ �Y@}������9j@� �K�ͼ@��������j@�u�������j@S :+23333sj@gffff�s@effff�i@gffff�s@�����i@S�������,h@��233333g@    �s@�����9f@����̬s@������e@gffff�s@ �
������s@������d@�����4t@�����\d@hffff~t@effff6d@hffff�t@233333d@�����Yu@�����,d@53333�u@����̬d@53333�u@������e@    v@233333f@�����v@������f@     v@�����lg@�`�@�h�g�
���`����(@Ό
���#@dt
`�`fW
�R�`1K
�  ���8
 ��������e@�1�`�o
Ӏ��`o�
�ԉ��
�ԉ@A�
� N���. ���z�u� #���u�@e� �����1� c�Ӏf�`�@�� ��G�`�@��`���S`������	i@� �& ���&0�����|h@ 43���������1u@��k��4`�K��4�����lg@S`A6�����lg@ �7�����lg@@�:�����lg@���4`�
��1���
��(@Ό
��|
 �`
�������q@@[7
`�@[7
����b
�`P��
 C������Lf@`~ 6�
������Iq@`C�
`~@��
`~���
������Iq@���
 {�����9g@��y �4������Dq@ �4@zv �4�����Aq@�-6�`~ �q�����Oq@ ���j�������h@S��������Li@������q@�����ii@ J������\i@S�:�23333Si@��� @����E`��������q@�����Yh@������q@ �q�`)��)������q@���
������q@��
� S`:�
��@dt
�|
 �`
��� +����� )��	���� ��������`@S �������`@ ������|`@`������<`@S �*effffF_@gffff�q@�����^@gffff�q@effff�\@43333�q@233333\@�m$������[@��effff[@S`�23333�Z@@+efffffZ@ ������Z@S`b����̬Y@ ������Y@`�������yY@S �23333sY@�&�23333�Y@ x������Z@gffffVq@����̌Z@��|�����[@��|13333�[@S {13333�\@43333Kq@�����L^@gffffNq@����̬_@��5��� ׋@b��� +�	5.      �� 5C      -   5         ��Name$ 	txt_title��5C   3   $��Serials��6$   
�������$
��Left=�5D   $   $��Center=�6?   $��1��5E   $   $	��5,0q�69   5F      5G      5I      5K      �� 5L   
   $��1,0,1,1q�6   $��1��6,   $ 0,0,7,7��5M      ���#999999
�������._�5N      �  5O      �� 5P      $��60 �6$   �� 5Q      $
��auto �6$   �� 5R      $��55 �6$   �� 5S      $��* �6$   �� 5T      $��45 �6$   �� 5U      $��45 �6$   .+�5W      �  5X      �� 5Y      $��* �6+   �� 5Z      $
��auto �6,   �� 5[      $
��auto �6,   �� 5\      $
��auto �6,   .+�5^      �� $ 10��6   $��15,10q�60   $��1q�6A      	MainColor#��[  6U   ._�5_      �  5`      �� 5a   "   $
��auto �64   �� 5b   "   $��* �63   .+�5d      �� $��50��6&   $ 7.5,0,0,7.5��61   ���#178DD2._�5f   "   F� ���#E8E8E8$
 Fill=�66   $��Center=�5g      $��0��6<   $��Center=�5h      $
��17.5��65   $
��17.5��6B   ����p��ffffff0@������lW@���fffff&P@��������LG@ffffff0@������`��`,a 0v�hx�`r��ō�������}��q����f�z��@) ����Z @ sӀ�  ���� `�Z  GS@�� �����y_@ $� ����. G��. G�. G�. G� B� �{�������F@��D�������F@��D� ���$7Ѡ'�@��S���43333U@`�������J@�A � �V `� ظ23333]@@�~�`���k�~�fffff&@@��ffffff0@Q��ffffff0@� K@zA�����LV@43333�T@@�`6 �����LL@@zA�����F@43333sM@�����F@gfffffC@�����LL@hfffff:@S�a     ,@�����LV@������+@ Khfffff:@S��i433333@@���    @D@���43333sH@� 3� Tj��i�����YP@ K@zA�`}�`F�Ӏ`F�gffff�S@@2Ygffff�S@`���gffff�S@�d�43333�S@�����=@  � ��� ����`�y �,�{s@y��`am �������'�Э �-��W`��3 �� ]����������H@S ��������G@@��������F@ M�������E@� B� �� ��`F�`}�`F�	5i      5o      �� 5p      -   5         ��Name$ 	tb_search��5p   &   $��1��6:    % !MaterialDesignFloatingHintTextBox#��[ 5q   &   )  #MaterialDesignThemes.Wpf.HintAssist   Hint$% Enter Here To Start Search ....��5r   &   ���#4E4E4E$��10,5,0,0q�5s   <    �� 	MaxLength$ 50��5t   &   $��0q�65   $��40��5v   &   $��0,0,4,0q�64   .  (MaterialDesignThemes.Wpf.TextFieldAssist   CharacterCounterStyle 5u   &   �� 5w   &   5x      5y      �� 5z      -   5        $ btn_refresh��5z   S   $��LeftToRight=�6   $��40��6<   $��40��6G   $��0��6�   $��3��6�   $��0q�6�   +  %MaterialDesignThemes.Wpf.ButtonAssist   CornerRadius$ 15��5{       � Cursor$
 Hand��6K     SmallButtonCircleRotate#��[ 5|   J   $	��5,1q�5}       J� RenderTransformOrigin$ 0.5,0.5&�6/    � DataContext$�
 �
M896,0L896,0C401.2,0,0,401.2,0,896v0c0,494.8,401.2,896,896,896h0c494.8,0,896-401.2,896-896v0C1792,401.2,1390.8,0,896,0z   M1451.3,1021c-31.9,133.7-98.8,242.1-200.6,325.2c-101.8,83.1-221,124.6-357.7,124.6c-72.8,0-143.3-13.7-211.4-41.2  s-128.8-66.6-182.2-117.5l-96.5,96.5c-9.5,9.5-20.7,14.2-33.7,14.2s-24.2-4.7-33.7-14.2c-9.5-9.5-14.2-20.7-14.2-33.7v-335.3  c0-13,4.7-24.2,14.2-33.7s20.7-14.2,33.7-14.2h335.3c13,0,24.2,4.7,33.7,14.2c9.5,9.5,14.2,20.7,14.2,33.7c0,13-4.7,24.2-14.2,33.7  l-102.5,102.5c35.4,32.9,75.6,58.4,120.5,76.3c44.9,18,91.5,26.9,139.9,26.9c66.9,0,129.2-16.2,187.1-48.6  c57.9-32.4,104.3-77.1,139.2-134c5.5-8.5,18.7-37.7,39.7-87.6c4-11.5,11.5-17.2,22.4-17.2h143.7c6.5,0,12.1,2.4,16.8,7.1  c4.7,4.7,7.1,10.4,7.1,16.8C1452,1018.2,1451.8,1020,1451.3,1021z M1470.7,752.3c0,13-4.7,24.2-14.2,33.7  c-9.5,9.5-20.7,14.2-33.7,14.2h-335.3c-13,0-24.2-4.7-33.7-14.2s-14.2-20.7-14.2-33.7c0-13,4.7-24.2,14.2-33.7l103.3-103.3  C1083.3,547,996.3,512.9,896,512.9c-66.9,0-129.2,16.2-187.1,48.6s-104.3,77.1-139.2,134c-5.5,8.5-18.7,37.7-39.7,87.6  c-4,11.5-11.5,17.2-22.5,17.2H358.7c-6.5,0-12.1-2.4-16.8-7.1c-4.7-4.7-7.1-10.4-7.1-16.8V771c32.4-133.7,99.8-242.1,202-325.2  c102.3-83.1,222-124.6,359.2-124.6c72.8,0,143.7,13.8,212.5,41.5s130,66.7,183.3,117.1l97.3-96.5c9.5-9.5,20.7-14.2,33.7-14.2  s24.2,4.7,33.7,14.2c9.5,9.5,14.2,20.7,14.2,33.7V752.3z��5~      ��5|      Z� ��61   Z� z�5�      V� 5�      .~�5�   "   �� �� 5�   "   �� 5�   "    �� Angle$ 0Q�62   T� 5�   "   5�       5�      _� 5�      -   5        $ 
tt_refresh��5�   &   $��Refresh��6:   $
 left=�5�   /   $ 15��5�   /   $ 50,0,0,0�5�   /   $ 25��5�   /   5�      5�      �� 5�      $��1��6   $��0��6$   $��3��65   $
 Fill=�6I   ���#DFDFDF	 �� X2$ 1��6j   $��1,1,1,1q�6r   $��Bottom=�5�      � 5�      $��2��6    5�      �� 5�      $��* �6+   �� 5�      $��* �6+   .+�5�      �� -	   5         ��Name$ chk_allSerials��5�      $��0��63   $��10q�6C   $��Right=�6O     MainColorBlue#��[ 6f   $��
Select All��5�       2 .MaterialDesignFilterChipPrimaryOutlineCheckBox#��[ 60   5�   <   �� 5�      $��2��6   $ 10��6)   $��	10,5,10,5q�6;   $��1q�6P   #��[  6d   ._�5�      �� -
   5         ��Name$ cb_itemPerPage��5�   $   $��10,5,5,5q�6<   ���#4E4E4E$	��4,0q�5�   F    & "MaterialDesignFloatingHintComboBox#��[ 5�   $   $ Items per page...��5�   $   $��Center=�5�   $   $��0q�6?   $��40��5�   $   {�. 5�      5�      5�      �� 5�      $��3��6   $��10q�6'   ���#999999$��1q�6K   ._�5�      &   System.Windows.Controls.DataGrid  -   5           Name$  
dg_serials��5�      
�������$y�Visible=�5�      $��Center=�64   !   CanUserAddRows! .  "   AutoGenerateColumns" .  #   ColumnWidth5  /System.Windows.Controls.DataGridLengthConverter$# SizeToHeader 5�      $   Columns$ 5�      4  .System.Windows.Controls.DataGridTemplateColumn  5�      ,  &System.Windows.Controls.DataGridColumn%   Header$% Serial��65   &   Width$& 2* 6E   '   CellTemplate' 5�   "   �� 5�   &   .R�5�   *   �� $ 	tb_serial��62   -   5        ( �� 
IsReadOnly( . $��0q�5�   I   ��5�   ^   �� ) �� Path$) serial���5�   2   Z� ��6_   Z� 5�   2   5�   '   5�      0	  *System.Windows.Controls.DataGridTextColumn	  5�      $& * 61   $% Branch��6<   1
  +System.Windows.Controls.DataGridBoundColumn* 
  Binding* 6L   �� $) 
branchName�+ 
  ElementStyle+ 5�   "   �� 5�   &   , �� 
TargetType", ��6,   - �� Triggers- 5�   *   �� 5�   .   . �� Binding. 6:   �� *
isActive+/ �� Value/ 06W   .a�5�   2   �� 0 �� Property0 � ��1 �� Value$1 Strikethrough{�6T   5�   /   5�   '   5�      	  5�      $& * 61   2   
IsReadOnly2 . $	% POS��6M   * 6Z   �� $) posName�+ 5�   "   �� 5�   &   ", ��6,   - 5�   *   �� 5�   .   . 6:   �� *
isActive+/ 06W   .a�5�   2   �� 0 � ��$1 Strikethrough{�6T   5�   /   5�   '   5�      4  .System.Windows.Controls.DataGridCheckBoxColumn  5�      -   5        
col_active��$
& 0.5* 5�   J   $% Active��6Y   * 6k   �� $) isActive�5�      5�      � 5�      $��4��6    5�      �� 5�      $
��auto �6+   �� 5�      $��50 �6+   �� 5�      $
��auto �6+   .+�5�      �� $��0,0,0,1q�6   ���#178DD2$��	10,0,10,0q�6I   $
��auto��6\   $��0��5�      $
��Left=�6(   $��Bottom=�6C   ._�5�      �� 3 �� Orientation$3 
Horizontal=�6"   .+�5�      �� -   5        $ btn_pdf��5�   !   $��10,0,5,0q�6L   $��0q�5�   !   $��35��6-   ��5�   4   Z� ��5�   9   Z� .��5�        ���#D20A0A$
 FilePdf=�6K   $��22��5�   6   $��22��6A    5�   "   _� 5�   &   -   5        $ 	tt_report��5�   .   $
 left=�5�   /   $ 5��5�   /   $ 50,0,0,0�5�   /   $ 20��5�   /   5�      5�      �� 5�      -   5        $ btn_exportToExcel��5�   "   $��5,0,5,0q�5�   8   $��0q�6I   $��35��6U   ��6"   Z� ��5�   =   Z� .��5�      F� ���#378500$
 Fill=�62   $��20��5�      $��20��6&   $��LeftToRight=�5�      ��������- � $� ��- � $�  O[ ��c" O[ Q�c"H�z� @Q $� H�z� @� $� ��� ���!��� ���! � � $�  � � $� ��� ���!��� ���! $� � $�  $� � $� �����!�����! -1� $�  -1� $� ��^����^������^���h�X���P�Qр��0; Ӏ���3 �����- ���- � 6n -1� -1 -1� -1��� 6n��� 6n -1� 6n $� � -1 $� � -1��� � 6n��� � 6n $� � 6n � � -1 � � -1��� � 6n��� � 6n � � 6n z � -1 z � -1��[ � 6n��[ � 6n z �    (, �    @�`���� �������     �    (, ��Ɛ  �E�����@Zd;ߏ-@�H$u Щ� U-��o@v��/�,@���x�&@��~j�4,@Q؛r ��~j�4,@��r P�� @�p 0)� �	o ��� ��QT  ����*  �Q8\ �x�&1*@�/ �Ry ��bY �Ry ��MbX9@੧ �x4q `S�  �r ��� p=
ףp@�v���'@Yd;�O�@�v���'@G�z��@|?5^�I'@MbX94@23333�&@k�����@�8� n���!#@������@���K7(@������@�0�Z$"@��� ��A`��b(@�рƐ  �рƐ  �	 5  "   _� 5  &   -   5        $ tt_excel��5  .   $
 left=�5  /   $ 35��5  /   $ 50,0,0,0�5  /   $ 20��5  /   5	     5
     �� 5     -   5        $ 	txt_count��5  <   $��0,0,0,0q�6R   4 �� Padding$4 10q�5     $��0��6,   ���#378500$y�	Collapsed=�6K   ��5  &   Z�  5     _� 5  "   -   5        $ tt_count��5  *   $
 left=�5  /   $ 35��5  /   $ 	50,25,0,0�5  /   $ 20��5  /   5     5     5     � 5     $��	10,0,10,5q�6    $
��auto��63   $��2��5     $
��Left=�6(   $��Bottom=�6C    5     �� 5  "   $��* �63   �� 5  "   $��* �63   �� 5  "   $��* �63   �� 5   "   $��* �63   �� 5!  "   $��* �63   �� 5"  "   $��* �63   .+�5$     �� -   5        $ btn_firstPage��5%  I   $��0��5$  %   $
��Left=�65   $��10,0,5,0q�6Q   $��25��5%  %   $��25��61   $��0q�6=   ���#686868���#DFDFDF$��0q�5&  U   .��5(  "   F� -   5        5 F�Name$5 path_firstPage��5(  F   ���#686868$
 Fill=�66   $��Center=�5)  '   $��0��6D   $��Center=�5*  '   $��12��6B   $��12��6M   ����� @, �l� Q @, hfffff@S @,      @`M/ hfffff@�Z2 hfffff@������@hfffff@��9      @��9 hfffff@���9 �l� S��9 433333'@������@�� �Z2 �� �`M/  ��  @, �y�  @, �l� � 	=  ~u ���j � � � �m `�� ��s � � ��s �ا Q��s ������@S��s ������@�co ������ @��j ������@� 	= �.c ���9 �;f ��9 @�p  	=  ~u 	 5-  &   _� 5.  *   -   5        $ tt_first��5.  2   $
 left=�5/  /   $ 5��50  /   $ 50,0,0,0�51  /   $	 -10��52  /   54  #   55     �� 56     -   5        $ btn_prevPage��57  I   $��1��56  !   $
��Left=�61   $��10,0,5,0q�6M   $��25��57  %   $��25��61   $��0q�6=   ���#686868���#DFDFDF$��0q�58  U   $��1��59  %   $
��Bold"�61   5;     �� 5<     -   5        $ btn_curPage��5=  I   $��2��5<  !   $
��Left=�61   $��10,0,5,0q�6M   $��25��5=  %   $��25��61   $��0q�6=   ���#686868���#DFDFDF$��0q�5>  U   $��2��5?  %   $
��Bold"�61   5A     �� 5B     -   5        $ btn_nextPage��5C  I   $��3��5B  !   $
��Left=�61   $��10,0,5,0q�6M   $��25��5C  %   $��25��61   $��0q�6=   ���#686868���#DFDFDF$��0q�5D  U   $��3��5E  %   $
��Bold"�61   5G     �� 5L     -   5        $ btn_lastPage��5M  I   $��4��5L  %   $��Right=�65   $��10,0,5,0q�6R   $��25��5M  %   $��25��61   $��0q�6=   ���#686868���#DFDFDF$��0q�5N  U   .��5Q  "   F� -   5        $5 path_lastPage��5Q  E   ���#686868$
 Fill=�66   $��Center=�5R  '   $��0��6D   $��Center=�5S  '   $��12��6B   $��12��6M   �������s ��* р�s  � Ӏ�s �y� ������@ �� `Vl  �� Ӏ�g  �� @�d �y� @�d  � �@�d ��* �@�d �%& ��g `# `Vl `# �@�p `# ��s �%& ��s ��* � �a  �a 433333@     @S �0 ������@gfffff@     @gfffff@������@�gfffff@�ا �gfffff@� � `M/  � 433333@� � Q �a ������@�@�d �co @�d �;f  �a  �a 	 5V  &   _� 5W  *   -   5        $ tt_last��5W  2   $
 left=�5X  /   $ 5��5Y  /   $ 50,0,0,0�5Z  /   $	 -10��5[  /   5]  #   5^     �� 5`     -   5        $ tb_page��5`  "   $��10,0,5,0q�66   $��5��6I   $y�	Collapsed=�6Y   #��[ 5a  &   $��0q�5b  &   $��50��6<   ���#4E4E4E$��40��5d  &   $	��4,0q�64    5c  <   �� 5g  &   5i     5k     �� 5l     -   5        $ btn_save��5m  )   $
��Save��5l     $��5��6(   $��5��65   $��10,2.5q�5m     ���#178DD2��5n  .   Z� 5o     5q     5t     5u     