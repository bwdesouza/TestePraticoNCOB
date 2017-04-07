using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TesteNCOB.Startup))]
namespace TesteNCOB
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
