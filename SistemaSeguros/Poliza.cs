//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SistemaSeguros
{
    using System;
    using System.Collections.Generic;
    
    public partial class Poliza
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Poliza()
        {
            this.PolizaPorCliente = new HashSet<PolizaPorCliente>();
            this.Cobertura = new HashSet<Cobertura>();
        }
    
        public int ID_Poliza { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int FK_TipoRiesgo { get; set; }
    
        public virtual TipoRiesgo TipoRiesgo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PolizaPorCliente> PolizaPorCliente { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cobertura> Cobertura { get; set; }
    }
}
