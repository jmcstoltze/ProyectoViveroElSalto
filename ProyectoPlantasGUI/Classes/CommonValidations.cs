using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Input;

namespace ProyectoPlantasGUI.Classes
{
    public class CommonValidations
    {
        // Para expresiones que deben ser netamente númericas
        private static Regex s_regex = new Regex("[^0-9]+");

        public static void CheckTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = s_regex.IsMatch(e.Text);
        }
    }
}
