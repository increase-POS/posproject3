﻿#pragma checksum "..\..\..\..\View\sales\uc_sales.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "1BDB2497BB5099DFA074FEEF7B6239642D86A71459AE69D2E1E4C00E40E7D99C"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using AdministratorApp.View.sales;
using MaterialDesignThemes.Wpf;
using MaterialDesignThemes.Wpf.Converters;
using MaterialDesignThemes.Wpf.Transitions;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace AdministratorApp.View.sales {
    
    
    /// <summary>
    /// uc_sales
    /// </summary>
    public partial class uc_sales : System.Windows.Controls.UserControl, System.Windows.Markup.IComponentConnector {
        
        
        #line 10 "..\..\..\..\View\sales\uc_sales.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid grid_mainGrid;
        
        #line default
        #line hidden
        
        
        #line 25 "..\..\..\..\View\sales\uc_sales.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btn_sale;
        
        #line default
        #line hidden
        
        
        #line 29 "..\..\..\..\View\sales\uc_sales.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btn_packageUser;
        
        #line default
        #line hidden
        
        
        #line 33 "..\..\..\..\View\sales\uc_sales.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btn_posSerials;
        
        #line default
        #line hidden
        
        
        #line 36 "..\..\..\..\View\sales\uc_sales.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Grid grid_main;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/AdministratorApp;component/view/sales/uc_sales.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\..\View\sales\uc_sales.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            
            #line 7 "..\..\..\..\View\sales\uc_sales.xaml"
            ((AdministratorApp.View.sales.uc_sales)(target)).Loaded += new System.Windows.RoutedEventHandler(this.Window_Loaded);
            
            #line default
            #line hidden
            return;
            case 2:
            this.grid_mainGrid = ((System.Windows.Controls.Grid)(target));
            return;
            case 3:
            this.btn_sale = ((System.Windows.Controls.Button)(target));
            
            #line 25 "..\..\..\..\View\sales\uc_sales.xaml"
            this.btn_sale.Click += new System.Windows.RoutedEventHandler(this.Btn_sale_Click);
            
            #line default
            #line hidden
            return;
            case 4:
            this.btn_packageUser = ((System.Windows.Controls.Button)(target));
            
            #line 29 "..\..\..\..\View\sales\uc_sales.xaml"
            this.btn_packageUser.Click += new System.Windows.RoutedEventHandler(this.Btn_packageUser_Click);
            
            #line default
            #line hidden
            return;
            case 5:
            this.btn_posSerials = ((System.Windows.Controls.Button)(target));
            
            #line 33 "..\..\..\..\View\sales\uc_sales.xaml"
            this.btn_posSerials.Click += new System.Windows.RoutedEventHandler(this.Btn_posSerials_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.grid_main = ((System.Windows.Controls.Grid)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}
