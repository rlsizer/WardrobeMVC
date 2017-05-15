using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WardrobeProject.Startup))]
namespace WardrobeProject
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
