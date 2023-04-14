using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MH.Domain.Model;

namespace MH.Domain.Model
{
    public class PositionModel
    {
        public int? Id { get; set; }
        public string Name { get; set; }
        public string? Description { get; set; }

    }
}
