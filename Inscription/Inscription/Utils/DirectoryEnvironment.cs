using System;
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Text.RegularExpressions;

namespace testingDS
{
    class DirectoryEnvironment
    {
        static string ldapURL = "LDAP://rwin.cegepoutaouais.qc.ca";
        static string domain = "rwin.cegepoutaouais.qc.ca";
        DirectoryEntry root;
        DirectorySearcher searcher;

        public DirectoryEnvironment(string num, string psw)
        {
            if (new PrincipalContext(ContextType.Domain, domain).ValidateCredentials(num, psw))
            {

                root = new DirectoryEntry("LDAP://rwin.cegepoutaouais.qc.ca", num, psw);
                searcher = new DirectorySearcher(root);
                searcher.Filter = "(CN=0785024)";
            }
            else
            {
                throw new System.Exception("Bad credentials.");
            }

            var result = searcher.FindOne();

            var entry = result.GetDirectoryEntry();

            ResultPropertyCollection rpc = result.Properties;

            Console.WriteLine(rpc["givenname"][0]);
            Console.WriteLine(rpc["sn"][0]);

            string program = rpc["memberof"].Cast<string>().Single(n => Regex.IsMatch(n, "^CN=[0-9]{3}[A-Z0-9]{2}"));
            DirectoryEntry group = new DirectoryEntry(ldapURL +'/' + program, num, psw);

            Console.WriteLine(group.Properties["description"][0]);
        }

        public static bool ValidateUser(string num, string psw)
        {
            if (new PrincipalContext(ContextType.Domain, domain).ValidateCredentials(num, psw))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public void GetUser(string num)
        {

        }
    }
}
