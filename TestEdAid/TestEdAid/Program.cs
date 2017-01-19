using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestEdAid
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Welcome to the Powers System");
            string input;
            var needInput = true;
            int num, power;
            do
            {
                num = power = 0;
                do
                {
                    Console.WriteLine("Please enter a number between 1 and 50:");
                    Console.WriteLine("(Or 0 to leave the application)");
                    input = Console.ReadLine();
                    needInput = !int.TryParse(input, out num);
                } while (num < 0 || needInput);

                if (num == 0)
                    return;

                needInput = true;
                do
                {
                    Console.WriteLine("Please enter a power between 1 and 10:");
                    input = Console.ReadLine();
                    needInput = !int.TryParse(input, out power);
                } while (power < 0 || needInput);

                var powers = Powers(num, power);
                PrintIntArrat(powers);                
                Console.WriteLine("Press anything to continue...");
                Console.ReadLine();
                Console.Clear();
            } while (num != 0);

        }

        public static ulong[] Powers(int num, int power)
        {
            var result = new List<ulong>();
            for (var i = 1; i <= power; i++)
            {
                var res = (ulong)Math.Pow(num, i);
                result.Add(res);
            }

            return result.ToArray();
        }

        public static void PrintIntArrat(ulong[] array)
        {
            Console.WriteLine("[{0}]", string.Join(", ", array));
        }
    }
}
