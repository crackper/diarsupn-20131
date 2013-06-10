using System.Data.Entity;
using System.Data.Entity.Infrastructure;
//debe quedar asi
using DBSystem.Repository.Mapping;
using DBSystem.Entities;

namespace DBSystem.Repository
{
    public partial class DBSystemContext : DbContext
    {
        static DBSystemContext()
        {
            Database.SetInitializer<DBSystemContext>(null);
        }

        public DBSystemContext()
            : base("Name=DBSystemContext")
        {
        }

        public DbSet<Categoria> Categorias { get; set; }
        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<DetallePedido> DetallePedidoes { get; set; }
        public DbSet<FormaPago> FormaPagoes { get; set; }
        public DbSet<Pedido> Pedidoes { get; set; }
        public DbSet<Producto> Productoes { get; set; }
        public DbSet<Proveedor> Proveedors { get; set; }
        public DbSet<RepUti> RepUtis { get; set; }
        public DbSet<sysdiagram> sysdiagrams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new CategoriaMap());
            modelBuilder.Configurations.Add(new ClienteMap());
            modelBuilder.Configurations.Add(new DetallePedidoMap());
            modelBuilder.Configurations.Add(new FormaPagoMap());
            modelBuilder.Configurations.Add(new PedidoMap());
            modelBuilder.Configurations.Add(new ProductoMap());
            modelBuilder.Configurations.Add(new ProveedorMap());
            modelBuilder.Configurations.Add(new RepUtiMap());
            modelBuilder.Configurations.Add(new sysdiagramMap());
        }
    }
}
