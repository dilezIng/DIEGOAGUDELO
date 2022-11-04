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
		[Route("VCNVISITANTElist/{OID?}")]
		[Route("Home/VCNVISITANTElist/{OID?}")]
		public async Task<IActionResult> VCNVISITANTElist()
		{

			// Create page object
			VCNVISITANTE_List = new _VCNVISITANTE_List(this);
			VCNVISITANTE_List.Cache = _cache;

			// Run the page
			return await VCNVISITANTE_List.Run();
		}

		// add
		[Route("VCNVISITANTEadd/{OID?}")]
		[Route("Home/VCNVISITANTEadd/{OID?}")]
		public async Task<IActionResult> VCNVISITANTEadd()
		{

			// Create page object
			VCNVISITANTE_Add = new _VCNVISITANTE_Add(this);

			// Run the page
			return await VCNVISITANTE_Add.Run();
		}

		// view
		[Route("VCNVISITANTEview/{OID?}")]
		[Route("Home/VCNVISITANTEview/{OID?}")]
		public async Task<IActionResult> VCNVISITANTEview()
		{

			// Create page object
			VCNVISITANTE_View = new _VCNVISITANTE_View(this);

			// Run the page
			return await VCNVISITANTE_View.Run();
		}

		// edit
		[Route("VCNVISITANTEedit/{OID?}")]
		[Route("Home/VCNVISITANTEedit/{OID?}")]
		public async Task<IActionResult> VCNVISITANTEedit()
		{

			// Create page object
			VCNVISITANTE_Edit = new _VCNVISITANTE_Edit(this);

			// Run the page
			return await VCNVISITANTE_Edit.Run();
		}

		// delete
		[Route("VCNVISITANTEdelete/{OID?}")]
		[Route("Home/VCNVISITANTEdelete/{OID?}")]
		public async Task<IActionResult> VCNVISITANTEdelete()
		{

			// Create page object
			VCNVISITANTE_Delete = new _VCNVISITANTE_Delete(this);

			// Run the page
			return await VCNVISITANTE_Delete.Run();
		}
	}
}
