using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MH.Domain.ViewModel
{
    public class IssueViewModel
    {
        public int? Id { get; set; }
        public string Name { get; set; }


        public DateTime DateCreated { get; set; }
    }
}
