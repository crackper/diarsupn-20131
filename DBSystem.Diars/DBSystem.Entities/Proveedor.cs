using System;
using System.Collections.Generic;

namespace DBSystem.Entities
{
    public partial class Proveedor
    {
        public int id { get; set; }
        public string razonSocial { get; set; }
        public string ruc { get; set; }
        public string direccion { get; set; }
        public string email { get; set; }
    }
}
