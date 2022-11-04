// Models
namespace AspNetMaker2019.Models {

	// Partial class
	public partial class project1 {

		// Menu language
		public static Lang MenuLanguage;

		// Set up menus
		public static void SetupMenus() {

			// Menu Language
			if (Language != null && Language.LanguageFolder == Config.LanguageFolder)
				MenuLanguage = Language;
			else
				MenuLanguage = new Lang();

			// Navbar menu
			var topMenu = new Menu("navbar", true, true);
			TopMenu = topMenu.ToScript();

			// Sidebar menu
			var sideMenu = new Menu("menu", true, false);
			sideMenu.AddMenuItem(2, "mi_INNCSUMPA", MenuLanguage.MenuPhrase("2", "MenuText"), "INNCSUMPAlist", -1, "", true, false, false, "", "", false);
			sideMenu.AddMenuItem(3, "mi_VCNVISITANTE", MenuLanguage.MenuPhrase("3", "MenuText"), "VCNVISITANTElist", -1, "", true, false, false, "", "", false);
			sideMenu.AddMenuItem(4, "mi_ULTIMO_INGRESO", MenuLanguage.MenuPhrase("4", "MenuText"), "ULTIMO_INGRESOlist", -1, "", true, false, false, "", "", false);
			sideMenu.AddMenuItem(5, "mi_View69", MenuLanguage.MenuPhrase("5", "MenuText"), "View69list", -1, "", true, false, false, "", "", false);
			SideMenu = sideMenu.ToScript();
		}
	}
}
