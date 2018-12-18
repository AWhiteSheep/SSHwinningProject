﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.DirectoryServices;
using System.Security;

namespace testingDS
{
    class Program
    {
        static void Main(string[] args)
        {
            string username = "";
            string pass = "";

            Console.Write("Num Etudiant: "); username = Console.ReadLine();
            Console.Write("Password: ");
            do
            {
                ConsoleKeyInfo key = Console.ReadKey(true);
                // Backspace Should Not Work
                if (key.Key != ConsoleKey.Backspace && key.Key != ConsoleKey.Enter)
                {
                    pass += key.KeyChar;
                    Console.Write("*");
                }
                else
                {
                    if (key.Key == ConsoleKey.Backspace && pass.Length > 0)
                    {
                        pass = pass.Substring(0, (pass.Length - 1));
                        Console.Write("\b \b");
                    }
                    else if (key.Key == ConsoleKey.Enter)
                    {
                        break;
                    }
                }
            } while (true);

            if (DirectoryEnvironment.ValidateUser(username, pass))
            {
                Console.WriteLine($"{System.Environment.NewLine} Numéro et mot de passe valides");
            }
            else
            {
                Console.WriteLine($"{System.Environment.NewLine} Numéro et mot de passe invalides");
            }
            Console.ReadKey();

            //new DirectoryEnvironment(username, pass);
        }
    }
}
