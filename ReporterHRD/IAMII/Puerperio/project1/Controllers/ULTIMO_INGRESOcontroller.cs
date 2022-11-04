// ASP.NET Maker 2019
// Copyright (c) 2019 e.World Technology Limited. All rights reserved.

using System;
using System.ComponentModel.DataAnnotations;
using System.Reflection;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.IdentityModel.Tokens;
using AspNetMaker2019.Models;
using static AspNetMaker2019.Models.project1;

// Controllers
namespace AspNetMaker2019.Controllers
{

	// Partial class
	public partial class HomeController : Controller
	{

		// list
		[Route("ULTIMO_INGRESOlist")]
		[Route("Home/ULTIMO_INGRESOlist")]
		public async Task<IActionResult> ULTIMO_INGRESOlist()
		{

			// Create page object
			ULTIMO_INGRESO_List = new _ULTIMO_INGRESO_List(this);
			ULTIMO_INGRESO_List.Cache = _cache;

			// Run the page
			return await ULTIMO_INGRESO_List.Run();
		}
	}
}
