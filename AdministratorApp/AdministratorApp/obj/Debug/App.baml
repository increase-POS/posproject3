   M S B A M L   `   `   `  ����K  GAdministratorApp, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null3clr-namespace:AdministratorAppAdministratorApp  5      I)clr-namespace:AdministratorApp.convertersAdministratorApp.converters  5          AdministratorApp.App   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      0localclr-namespace:AdministratorApp     5      @
converters)clr-namespace:AdministratorApp.converters     5      b ^MaterialDesignThemes.Wpf, Version=4.0.0.2422, Culture=neutral, PublicKeyToken=df2a72020bd7962aFmaterialDesign1http://materialdesigninxaml.net/winfx/xaml/themes  5        �� 	Resources  5
      9  3AdministratorApp.converters.unlimitedCountConverter   unlimitedCountConverter4  .AdministratorApp.converters.agentNameConverter  agentNameConverter:   4AdministratorApp.converters.permissionsNameConverter  permissionsNameConverter8  2AdministratorApp.converters.packagePeriodConverter  packagePeriodConverter3  -AdministratorApp.converters.isActiveConverter  isActiveConverter4   .AdministratorApp.converters.dateFrameConverter  dateFrameConverter4  .AdministratorApp.converters.unlimitedConverter  unlimitedConverter0  *AdministratorApp.converters.countConverter  countConverter  BarcodeFont 	 Font-cairo-light 
 Font-cairo-bold  ToolTipError �� 
TargetType �� BasedOn �� Property �� Value  ScrollBarTrackThumb �� 
TargetType �Name ��Name �� CornerRadius	 �� Triggers
 P� Property P� Value �� 
TargetName � RowDefinitions ]�Name ]� Thumb n�Name ]� IncreaseRepeatButton ��Name J� Opacity ]� DecreaseRepeatButton P� 
SourceName  ButtonSelectBrush  	DarkBrush �� Angle  SmallButtonCircleRotate20'	  !System.Windows.VisualStateManager 	  VisualStateGroups%
  System.Windows.VisualStateGroup 
  States   System.Windows.VisualState   
Storyboard g� Duration	 W� To �� TargetProperty �� 
TargetName	 �� To ��Name  �� RadiusX! �� RadiusY" F�Name# �� Stretch$ N� EnterActions9  3System.Windows.Media.Animation.EasingDoubleKeyFrame% O� KeyTime& O� Value  SmallButtonCircleRotate  
infoCircle  	MainColor' �� Color  SecondColor  Blue 
 Orange  Red  Grey  	LightGrey  veryLightGrey  
lightGreen  lightRed  mediumGreen  	mediumRed 	 White  MainColorBlue   MainColorOrange ! MainColorGrey " MainColorlightGrey # MainColorRed( �� MergedDictionaries) �� Source�� 5   
   ( 5f     �� 5g     $e) _pack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Light.xaml?�6!   �� 5h     $h) bpack://application:,,,/MaterialDesignThemes.Wpf;component/Themes/MaterialDesignTheme.Defaults.xaml?�6!   �� 5i     $t) npack://application:,,,/MaterialDesignColors;component/Themes/Recommended/Primary/MaterialDesignColor.blue.xaml?�6!   �� 5j     $s) mpack://application:,,,/MaterialDesignColors;component/Themes/Recommended/Accent/MaterialDesignColor.Blue.xaml?�6!   %  &	        &	      &	 &     &	 9     &	 L     &	 _     &	 r     &	 �     &	 �     &		     &	
 q    &	 �    7_�&	 P    '��     &	     &	 ,    &	 G    &	 [    &	 |    &	 �    &	 �    &	 �    &	      &	 !    &	 B    &	 c    &	 �    &	 �    &	 �    &	 �    &	     &	  )    &	! J    &	" k    &	# �      5      61     5      6,     5      62     5      62     5      6-     5      6,     5      6,     5      6(   *�5      `\IDAHC39M Code 39 Barcode, /AdministratorApp;component/fonts/#IDAHC39M Code 39 Barcode, Arial)�6�   *�5      QMcairo light, /AdministratorApp;component/fonts/cairo-font/#cairo light, Arial)�6�   *�5      PLcairo bold , /AdministratorApp;component/fonts/cairo-font/#cairo bold, Arial)�6�   �� 5*   
   " _�6%   8   .�5+      ��  � ��
 �  ��6+   �� 5,       � �� �	#15FF00006+   5-      �� 5/   
   " n�50   	   .�51      ��  � �� 52      �� 53      " n�6&   .R�54      � $
 Grid��6   .+�55      �� $��Stretch=�6(   $��Stretch=�56   !   $
��Auto��57   !   $
��Auto��58   !   
������ 59   !   �� 5:      $ CornerScrollBarRectangle��6%   $ 5��5;      $��Stretch=�5<      $��Stretch=�5=      $
��Auto��5>      $
��Auto��5?      $��0,1,0,1q�5@      #��z��5A      5B      	 5C      P� 5D      
 �@�Tag$ 
Horizontal��5E   !   . �5F   "   �� $ CornerScrollBarRectangle��6)    � ��$
 Auto��5H   !   �� 5I   "   $ CornerScrollBarRectangle��6)    � ��$ 6��5K   !   5L      5N      5P      5Q      �� 5R   
   " ��6   .�5S      ��  �@��IsFlicksEnabled .  5T      �� 5U       � �� �#ADABAB5V      �� 5W       � ��
 ���� 5X      �� 5Y       � ��$ 7��5Z      �� 5[       � �� 5\      �� 5]      " ��6&   .R�5^      � $ GridRoot��6   $��7��5_      #��z��5`       5a      �� 5b   "   $��0.00001* �60   .+�5d      ]� $ 
PART_Track��6$   $��0��5e      ��. |�.   5h   "   n� 5i   &   $ Thumb��6,   #��z��5j   %   #���  5k   %    5m   "   �� 5n   &   $ PageUp��63   $��ScrollBar.PageDownCommand��5o   -   $ 0Q�5p   -   |�.  5q   -    5s   "   �� 5t   &   $ PageDown��63   $��ScrollBar.PageUpCommand��5u   -   $ 0Q�5v   -   |�.  5w   -   5y      5z      	 5{      P� 5|      $ Thumb��6&   
 �@J�IsMouseOver . . �5   "   �� # �  6)   $ Thumb��5�   !    � ��5�   !   5�      P� 5�      $ Thumb��6&   
 �@n�
IsDragging . . �5�   "   �� # �  6)   $ Thumb��5�   !    � ��5�   !   5�      P� 5�      
 � {� .  . �5�   "   �� $ Thumb��6)    � y�$ 	Collapsed=�5�   !   5�      P� 5�      
 �@��Orientation$ 
Horizontal=�5�   !   . �5�   "   �� $ GridRoot��6)    �@�LayoutTransform 5�   &   �� 5�   *   $	 -90Q�6:   5�   #   �� 5�   "   $ 
PART_Track��6)    �@�LayoutTransform 5�   &   �� 5�   *   $	 -90Q�6:   5�   #   �� 5�   "    � ��$
 Auto��5�   !   �� 5�   "    � ��$ 8��5�   !   �� 5�   "   $ Thumb��6)    �@�Tag$ 
Horizontal��5�   !   �� 5�   "   $ PageDown��6)    � ��$ ScrollBar.PageLeftCommand��5�   !   �� 5�   "   $ PageUp��6)    � ��$  ScrollBar.PageRightCommand��5�   !   5�      5�      5�      5�      �� 5�      " ��66   .�5�      ��  � �� 5�      �� 5�      " ��6*   .R�5�      � $
 grid��6#   ���	#02FFFFFF 5�   "   
  5�   &   CommonStates��. 5�   *     
Normal��. 5�   .   �� .��5�   2   W� $ 0:0:0.6D�6B   $ 20X�6U   $ Height�6]   $ X��6�   W� 5�   2   $ 0:0:0.6D�6B   $ 20X�6U   $ Width�6]   $ X��6   W� 5�   2   $ 0D�6B   $ 1X�6O   $ Opacity�6V   $ X��6z   5�   /   5�   +     5�   *   	MouseOver��. 5�   .   �� .��5�   2   W� $ 0D�6B   $
 0.95X�6O   $ Opacity�6Y   $ X��6}   �� 5�   2   $ 0:0:0.6D�6A   $ #178DD2X�6T   $* $(Shape.Fill).(SolidColorBrush.Color)�5�   1   $ X��6r   5�   /   5�   +     5�   *   Pressed��. 5�   .   �� .��5�   2   �� $ 0:0:0.3D�6A   $ #9CD0EFX�6T   $* $(Shape.Fill).(SolidColorBrush.Color)�5�   1   $ X��6r   5�   /   5�   +   5�   '   .+�5�   "   �� $ 	rectangle��6,   #��z��6?   $  15��6c   $! 15��6p   $ 1Q�6}   F� 5�   "   $" X��6'   $��0q�62   ���#178DD2$��Center=�5�   .   $
# Fill=�5�   '   $��Center=�66   $��20��6Q   $��20��6]   ��5�   >   �� 5�   ]   5�      	 5�      P� 5�   "   
 �@J�IsMouseOver . $ 5�   &   �� 5�   *   .��5�   .   �� .��5�   2   U� $V P(UIElement.RenderTransform).(TransformGroup.Children)[2].(RotateTransform.Angle)�6Q   .\�5�   6     $% 0:0:0��6K   & -906[     5�   6   $% 0:0:0.4��6K   & -3606]   5�   3   5�   /   5�   +   5�   #   5�      5�      5      �� 5     " ��64   .�5     ��  � �� 5     �� 5     " ��6*   .R�5     � $
 grid��6#   ���	#02FFFFFF 5  "   
  5  &   CommonStates��. 5  *     
Normal��. 5	  .   �� .��5
  2   W� $ 0:0:0.6D�6B   $
 27.5X�6U   $ Height�6_   $ X��6�   W� 5  2   $ 0:0:0.6D�6B   $
 27.5X�6U   $ Width�6_   $ X��6�   W� 5  2   $ 0D�6B   $ 1X�6O   $ Opacity�6V   $ X��6z   5  /   5  +     5  *   	MouseOver��. 5  .   �� .��5  2   W� $ 0D�6B   $
 0.95X�6O   $ Opacity�6Y   $ X��6}   �� 5  2   $ 0:0:0.6D�6A   $ #178DD2X�6T   $* $(Shape.Fill).(SolidColorBrush.Color)�5  1   $ X��6r   5  /   5  +     5  *   Pressed��. 5  .   �� .��5  2   �� $ 0:0:0.3D�6A   $ #9CD0EFX�6T   $* $(Shape.Fill).(SolidColorBrush.Color)�5  1   $ X��6r   5  /   5  +   5  '   .+�5  "   �� $ 	rectangle��6,   #��z��6?   $  15��6c   $! 15��6p   $ 1Q�6}   F� 5  "   $" X��6'   $��0q�62   ���#178DD2$��Center=�5   .   $
# Fill=�5!  '   $��Center=�66   $
��27.5��6Q   $
��27.5��6_   ��5  >   �� 5!  _   5"     	 5#     P� 5$  "   
 �@J�IsMouseOver . $ 5%  &   �� 5&  *   .��5'  .   �� .��5(  2   U� $V P(UIElement.RenderTransform).(TransformGroup.Children)[2].(RotateTransform.Angle)�6Q   .\�5)  6     $% 0:0:0��6K   & -906[     5*  6   $% 0:0:0.3��6K   & -3606]   5+  3   5:  /   5;  +   5E  #   5G     5I     5K     �5N     ��M12,2 C6.48,2 2,6.48 2,12 C2,17.52 6.48,22 12,22 C17.52,22 22,17.52 22,12 C22,6.48 17.52,2 12,2 Z M12,13 C11.45,13 11,12.55 11,12 L11,8 C11,7.45 11.45,7 12,7 C12.55,7 13,7.45 13,8 L13,12 C13,12.55 12.55,13 12,13 Z M13,17 L11,17 L11,15 L13,15 L13,17 Z�6'  �� 5R     $' #2491EA��60   �� 5S     $' #545E66��62   �� 5T     $' #178DD2��6+   �� 5U     $' #FFA926��6-   �� 5V     $' #D22A17��6*   �� 5W     $' #4E4E4E��6+   �� 5X     $' #8C8C8C��60   �� 5Y     $' #DFDFDF��64   �� 5Z     $' #E2EFDA��61   �� 5[     $' #FCE4D6��6/   �� 5\     $' #008A1C��62   �� 5]     $' #E53D29��60   �� 5^     $' #FFFFFF��6,   �� 5_     $' #178DD2��64   �� 5`     $' #FFA926��66   �� 5a     $' #4E4E4E��64   �� 5b     $' #DFDFDF��69   �� 5c     $' #D22A17��63   5l     5n     