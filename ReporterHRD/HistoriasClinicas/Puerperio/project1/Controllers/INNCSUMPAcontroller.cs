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
		[Route("INNCSUMPAlist/{OID?}")]
		[Route("Home/INNCSUMPAlist/{OID?}")]
		public async Task<IActionResult> INNCSUMPAlist()
		{

			// Create page object
			INNCSUMPA_List = new _INNCSUMPA_List(this);
			INNCSUMPA_List.Cache = _cache;

			// Run the page
			return await INNCSUMPA_List.Run();
		}

		// add
		[Route("INNCSUMPAadd/{OID?}")]
		[Route("Home/INNCSUMPAadd/{OID?}")]
		public async Task<IActionResult> INNCSUMPAadd()
		{

			// Create page object
			INNCSUMPA_Add = new _INNCSUMPA_Add(this);

			// Run the page
			return await INNCSUMPA_Add.Run();
		}

		// view
		[Route("INNCSUMPAview/{OID?}")]
		[Route("Home/INNCSUMPAview/{OID?}")]
		public async Task<IActionResult> INNCSUMPAview()
		{

			// Create page object
			INNCSUMPA_View = new _INNCSUMPA_View(this);

			// Run the page
			return await INNCSUMPA_View.Run();
		}

		// edit
		[Route("INNCSUMPAedit/{OID?}")]
		[Route("Home/INNCSUMPAedit/{OID?}")]
		public async Task<IActionResult> INNCSUMPAedit()
		{

			// Create page object
			INNCSUMPA_Edit = new _INNCSUMPA_Edit(this);

			// Run the page
			return await INNCSUMPA_Edit.Run();
		}

		// delete
		[Route("INNCSUMPAdelete/{OID?}")]
		[Route("Home/INNCSUMPAdelete/{OID?}")]
		public async Task<IActionResult> INNCSUMPAdelete()
		{

			// Create page object
			INNCSUMPA_Delete = new _INNCSUMPA_Delete(this);

			// Run the page
			return await INNCSUMPA_Delete.Run();
		}
	}
}
