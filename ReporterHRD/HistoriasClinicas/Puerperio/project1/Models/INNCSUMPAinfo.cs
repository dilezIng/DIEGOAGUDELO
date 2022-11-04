// ASP.NET Maker 2019
// Copyright (c) 2019 e.World Technology Limited. All rights reserved.

using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Dynamic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Linq;
using Microsoft.AspNetCore.Antiforgery;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Http.Internal;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Abstractions;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewFeatures.Internal;
using Microsoft.AspNetCore.Routing;
using Microsoft.AspNetCore.StaticFiles;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Primitives;
using Microsoft.IdentityModel.Tokens;
using Microsoft.Net.Http.Headers;
using Ganss.XSS;
using ImageMagick;
using MimeDetective.InMemory;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Serialization;
using static AspNetMaker2019.Models.project1;

// Models (Table)
namespace AspNetMaker2019.Models {

	// Partial class
	public partial class project1 {

		/// <summary>
		/// INNCSUMPA
		/// </summary>

		public static _INNCSUMPA INNCSUMPA {
			get => HttpData.GetOrCreate<_INNCSUMPA>("INNCSUMPA");
			set => HttpData["INNCSUMPA"] = value;
		}

		/// <summary>
		/// Table class for INNCSUMPA
		/// </summary>

		public class _INNCSUMPA: DbTable {
			public int RowCnt = 0; // DN
			public bool UseSessionForListSql = true;

			// Column CSS classes
			public string LeftColumnClass = "col-sm-2 col-form-label ew-label";
			public string RightColumnClass = "col-sm-10";
			public string OffsetColumnClass = "col-sm-10 offset-sm-2";
			public string TableLeftColumnClass = "w-col-2";
			public readonly DbField<SqlDbType> OID;
			public readonly DbField<SqlDbType> ADNINGRESO;
			public readonly DbField<SqlDbType> SLNORDSER;
			public readonly DbField<SqlDbType> ISCESTPRO;
			public readonly DbField<SqlDbType> GEENMedico;
			public readonly DbField<SqlDbType> INNALMACE;
			public readonly DbField<SqlDbType> GENARESER;
			public readonly DbField<SqlDbType> ISCDETALL;
			public readonly DbField<SqlDbType> GENARESER1;
			public readonly DbField<SqlDbType> ISCSUMIORIGEN;
			public readonly DbField<SqlDbType> ISCSUMIPENDI;
			public readonly DbField<SqlDbType> INNORDDESC;
			public readonly DbField<SqlDbType> ISCSUMGENPEN;
			public readonly DbField<SqlDbType> ISCVRBASINC;
			public readonly DbField<SqlDbType> ISCPORINCRE;
			public readonly DbField<SqlDbType> ISCPORINCRE1;
			public readonly DbField<SqlDbType> ISCVALINCRE;
			public readonly DbField<SqlDbType> ISCVALINCRE1;
			public readonly DbField<SqlDbType> ISCOIDORIHCRE;
			public readonly DbField<SqlDbType> ISCTIPSOLDIS;
			public readonly DbField<SqlDbType> INNDISFORREC;
			public readonly DbField<SqlDbType> INNPENDICAB;
			public readonly DbField<SqlDbType> ISCINDIDESA;
			public readonly DbField<SqlDbType> ISCJUSTIFICA;
			public readonly DbField<SqlDbType> ISCFECORIGEN;
			public readonly DbField<SqlDbType> ISCGFMIDFOR;
			public readonly DbField<SqlDbType> INNCPLAPRO;
			public readonly DbField<SqlDbType> INNCCONFIR;
			public readonly DbField<SqlDbType> INNCAUTCONFCOMPEN;
			public readonly DbField<SqlDbType> INNCAUTANULCOMPEN;
			public readonly DbField<SqlDbType> ISCINTERCOMPEN;
			public readonly DbField<SqlDbType> ISCMEDREMICOMPEN;
			public readonly DbField<SqlDbType> ISCNUMMESCOMPEN;

			// Constructor
			public _INNCSUMPA() {

				// Language object // DN
				Language = Language ?? new Lang();
				TableVar = "INNCSUMPA";
				Name = "INNCSUMPA";
				Type = "TABLE";

				// Update Table
				UpdateTable = "[dbo].[INNCSUMPA]";
				DbId = "DB"; // DN
				ExportAll = true;
				ExportPageBreakCount = 0; // Page break per every n record (PDF only)
				ExportPageOrientation = "portrait"; // Page orientation (PDF only)
				ExportPageSize = "a4"; // Page size (PDF only)
				ExportExcelPageOrientation = ""; // Page orientation (EPPlus only)
				ExportExcelPageSize = ""; // Page size (EPPlus only)
				ExportColumnWidths = new float[] {  }; // Column widths (PDF only) // DN
				DetailAdd = false; // Allow detail add
				DetailEdit = false; // Allow detail edit
				DetailView = false; // Allow detail view
				ShowMultipleDetails = false; // Show multiple details
				GridAddRowCount = 5;
				AllowAddDeleteRow = true; // Allow add/delete row
				UserIdAllowSecurity = 0; // User ID Allow
				BasicSearch = new BasicSearch(TableVar);

				// OID
				OID = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_OID",
					Name = "OID",
					Expression = "[OID]",
					BasicSearchExpression = "CAST([OID] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[OID]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "RADIO",
					IsPrimaryKey = true, // Primary key field
					Nullable = false, // NOT NULL field
					Required = true, // Required field
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				OID.Init(this); // DN
				Fields.Add("OID", OID);

				// ADNINGRESO
				ADNINGRESO = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ADNINGRESO",
					Name = "ADNINGRESO",
					Expression = "[ADNINGRESO]",
					BasicSearchExpression = "CAST([ADNINGRESO] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[ADNINGRESO]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				ADNINGRESO.Init(this); // DN
				Fields.Add("ADNINGRESO", ADNINGRESO);

				// SLNORDSER
				SLNORDSER = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_SLNORDSER",
					Name = "SLNORDSER",
					Expression = "[SLNORDSER]",
					BasicSearchExpression = "CAST([SLNORDSER] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[SLNORDSER]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				SLNORDSER.Init(this); // DN
				Fields.Add("SLNORDSER", SLNORDSER);

				// ISCESTPRO
				ISCESTPRO = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCESTPRO",
					Name = "ISCESTPRO",
					Expression = "[ISCESTPRO]",
					BasicSearchExpression = "CAST([ISCESTPRO] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCESTPRO]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				ISCESTPRO.Init(this); // DN
				Fields.Add("ISCESTPRO", ISCESTPRO);

				// GEENMedico
				GEENMedico = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_GEENMedico",
					Name = "GEENMedico",
					Expression = "[GEENMedico]",
					BasicSearchExpression = "CAST([GEENMedico] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[GEENMedico]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				GEENMedico.Init(this); // DN
				Fields.Add("GEENMedico", GEENMedico);

				// INNALMACE
				INNALMACE = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_INNALMACE",
					Name = "INNALMACE",
					Expression = "[INNALMACE]",
					BasicSearchExpression = "CAST([INNALMACE] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[INNALMACE]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				INNALMACE.Init(this); // DN
				Fields.Add("INNALMACE", INNALMACE);

				// GENARESER
				GENARESER = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_GENARESER",
					Name = "GENARESER",
					Expression = "[GENARESER]",
					BasicSearchExpression = "CAST([GENARESER] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[GENARESER]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				GENARESER.Init(this); // DN
				Fields.Add("GENARESER", GENARESER);

				// ISCDETALL
				ISCDETALL = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCDETALL",
					Name = "ISCDETALL",
					Expression = "[ISCDETALL]",
					BasicSearchExpression = "[ISCDETALL]",
					Type = 203,
					DbType = SqlDbType.NText,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCDETALL]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXTAREA",
					Sortable = true, // Allow sort
					IsUpload = false
				};
				ISCDETALL.Init(this); // DN
				Fields.Add("ISCDETALL", ISCDETALL);

				// GENARESER1
				GENARESER1 = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_GENARESER1",
					Name = "GENARESER1",
					Expression = "[GENARESER1]",
					BasicSearchExpression = "CAST([GENARESER1] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[GENARESER1]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				GENARESER1.Init(this); // DN
				Fields.Add("GENARESER1", GENARESER1);

				// ISCSUMIORIGEN
				ISCSUMIORIGEN = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCSUMIORIGEN",
					Name = "ISCSUMIORIGEN",
					Expression = "[ISCSUMIORIGEN]",
					BasicSearchExpression = "CAST([ISCSUMIORIGEN] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCSUMIORIGEN]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				ISCSUMIORIGEN.Init(this); // DN
				Fields.Add("ISCSUMIORIGEN", ISCSUMIORIGEN);

				// ISCSUMIPENDI
				ISCSUMIPENDI = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCSUMIPENDI",
					Name = "ISCSUMIPENDI",
					Expression = "[ISCSUMIPENDI]",
					BasicSearchExpression = "CAST([ISCSUMIPENDI] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCSUMIPENDI]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				ISCSUMIPENDI.Init(this); // DN
				Fields.Add("ISCSUMIPENDI", ISCSUMIPENDI);

				// INNORDDESC
				INNORDDESC = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_INNORDDESC",
					Name = "INNORDDESC",
					Expression = "[INNORDDESC]",
					BasicSearchExpression = "CAST([INNORDDESC] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[INNORDDESC]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				INNORDDESC.Init(this); // DN
				Fields.Add("INNORDDESC", INNORDDESC);

				// ISCSUMGENPEN
				ISCSUMGENPEN = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCSUMGENPEN",
					Name = "ISCSUMGENPEN",
					Expression = "[ISCSUMGENPEN]",
					BasicSearchExpression = "[ISCSUMGENPEN]",
					Type = 11,
					DbType = SqlDbType.Bit,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCSUMGENPEN]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "CHECKBOX",
					Sortable = true, // Allow sort
					DataType = Config.DataTypeBoolean,
					OptionCount = 2,
					IsUpload = false
				};
				ISCSUMGENPEN.Init(this); // DN
				ISCSUMGENPEN.Lookup = new Lookup("ISCSUMGENPEN", "INNCSUMPA", false, "", new List<string> {"", "", "", ""}, new List<string> {}, new List<string> {}, new List<string> {}, new List<string> {}, new List<string> {}, new List<string> {}, "", "");
				Fields.Add("ISCSUMGENPEN", ISCSUMGENPEN);

				// ISCVRBASINC
				ISCVRBASINC = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCVRBASINC",
					Name = "ISCVRBASINC",
					Expression = "[ISCVRBASINC]",
					BasicSearchExpression = "CAST([ISCVRBASINC] AS NVARCHAR)",
					Type = 6,
					DbType = SqlDbType.Money,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCVRBASINC]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectFloat"),
					IsUpload = false
				};
				ISCVRBASINC.Init(this); // DN
				Fields.Add("ISCVRBASINC", ISCVRBASINC);

				// ISCPORINCRE
				ISCPORINCRE = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCPORINCRE",
					Name = "ISCPORINCRE",
					Expression = "[ISCPORINCRE]",
					BasicSearchExpression = "CAST([ISCPORINCRE] AS NVARCHAR)",
					Type = 6,
					DbType = SqlDbType.Money,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCPORINCRE]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectFloat"),
					IsUpload = false
				};
				ISCPORINCRE.Init(this); // DN
				Fields.Add("ISCPORINCRE", ISCPORINCRE);

				// ISCPORINCRE1
				ISCPORINCRE1 = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCPORINCRE1",
					Name = "ISCPORINCRE1",
					Expression = "[ISCPORINCRE1]",
					BasicSearchExpression = "CAST([ISCPORINCRE1] AS NVARCHAR)",
					Type = 6,
					DbType = SqlDbType.Money,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCPORINCRE1]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectFloat"),
					IsUpload = false
				};
				ISCPORINCRE1.Init(this); // DN
				Fields.Add("ISCPORINCRE1", ISCPORINCRE1);

				// ISCVALINCRE
				ISCVALINCRE = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCVALINCRE",
					Name = "ISCVALINCRE",
					Expression = "[ISCVALINCRE]",
					BasicSearchExpression = "CAST([ISCVALINCRE] AS NVARCHAR)",
					Type = 6,
					DbType = SqlDbType.Money,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCVALINCRE]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectFloat"),
					IsUpload = false
				};
				ISCVALINCRE.Init(this); // DN
				Fields.Add("ISCVALINCRE", ISCVALINCRE);

				// ISCVALINCRE1
				ISCVALINCRE1 = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCVALINCRE1",
					Name = "ISCVALINCRE1",
					Expression = "[ISCVALINCRE1]",
					BasicSearchExpression = "CAST([ISCVALINCRE1] AS NVARCHAR)",
					Type = 6,
					DbType = SqlDbType.Money,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCVALINCRE1]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectFloat"),
					IsUpload = false
				};
				ISCVALINCRE1.Init(this); // DN
				Fields.Add("ISCVALINCRE1", ISCVALINCRE1);

				// ISCOIDORIHCRE
				ISCOIDORIHCRE = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCOIDORIHCRE",
					Name = "ISCOIDORIHCRE",
					Expression = "[ISCOIDORIHCRE]",
					BasicSearchExpression = "CAST([ISCOIDORIHCRE] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCOIDORIHCRE]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				ISCOIDORIHCRE.Init(this); // DN
				Fields.Add("ISCOIDORIHCRE", ISCOIDORIHCRE);

				// ISCTIPSOLDIS
				ISCTIPSOLDIS = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCTIPSOLDIS",
					Name = "ISCTIPSOLDIS",
					Expression = "[ISCTIPSOLDIS]",
					BasicSearchExpression = "CAST([ISCTIPSOLDIS] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCTIPSOLDIS]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				ISCTIPSOLDIS.Init(this); // DN
				Fields.Add("ISCTIPSOLDIS", ISCTIPSOLDIS);

				// INNDISFORREC
				INNDISFORREC = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_INNDISFORREC",
					Name = "INNDISFORREC",
					Expression = "[INNDISFORREC]",
					BasicSearchExpression = "CAST([INNDISFORREC] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[INNDISFORREC]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				INNDISFORREC.Init(this); // DN
				Fields.Add("INNDISFORREC", INNDISFORREC);

				// INNPENDICAB
				INNPENDICAB = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_INNPENDICAB",
					Name = "INNPENDICAB",
					Expression = "[INNPENDICAB]",
					BasicSearchExpression = "CAST([INNPENDICAB] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[INNPENDICAB]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				INNPENDICAB.Init(this); // DN
				Fields.Add("INNPENDICAB", INNPENDICAB);

				// ISCINDIDESA
				ISCINDIDESA = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCINDIDESA",
					Name = "ISCINDIDESA",
					Expression = "[ISCINDIDESA]",
					BasicSearchExpression = "[ISCINDIDESA]",
					Type = 11,
					DbType = SqlDbType.Bit,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCINDIDESA]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "CHECKBOX",
					Sortable = true, // Allow sort
					DataType = Config.DataTypeBoolean,
					OptionCount = 2,
					IsUpload = false
				};
				ISCINDIDESA.Init(this); // DN
				ISCINDIDESA.Lookup = new Lookup("ISCINDIDESA", "INNCSUMPA", false, "", new List<string> {"", "", "", ""}, new List<string> {}, new List<string> {}, new List<string> {}, new List<string> {}, new List<string> {}, new List<string> {}, "", "");
				Fields.Add("ISCINDIDESA", ISCINDIDESA);

				// ISCJUSTIFICA
				ISCJUSTIFICA = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCJUSTIFICA",
					Name = "ISCJUSTIFICA",
					Expression = "[ISCJUSTIFICA]",
					BasicSearchExpression = "[ISCJUSTIFICA]",
					Type = 202,
					DbType = SqlDbType.NVarChar,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCJUSTIFICA]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					IsUpload = false
				};
				ISCJUSTIFICA.Init(this); // DN
				Fields.Add("ISCJUSTIFICA", ISCJUSTIFICA);

				// ISCFECORIGEN
				ISCFECORIGEN = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCFECORIGEN",
					Name = "ISCFECORIGEN",
					Expression = "[ISCFECORIGEN]",
					BasicSearchExpression = CastDateFieldForLike("[ISCFECORIGEN]", 0, "DB"),
					Type = 135,
					DbType = SqlDbType.DateTime,
					DateTimeFormat = 0,
					VirtualExpression = "[ISCFECORIGEN]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectDate").Replace("%s", DateFormat),
					IsUpload = false
				};
				ISCFECORIGEN.Init(this); // DN
				Fields.Add("ISCFECORIGEN", ISCFECORIGEN);

				// ISCGFMIDFOR
				ISCGFMIDFOR = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCGFMIDFOR",
					Name = "ISCGFMIDFOR",
					Expression = "[ISCGFMIDFOR]",
					BasicSearchExpression = "[ISCGFMIDFOR]",
					Type = 202,
					DbType = SqlDbType.NVarChar,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCGFMIDFOR]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					IsUpload = false
				};
				ISCGFMIDFOR.Init(this); // DN
				Fields.Add("ISCGFMIDFOR", ISCGFMIDFOR);

				// INNCPLAPRO
				INNCPLAPRO = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_INNCPLAPRO",
					Name = "INNCPLAPRO",
					Expression = "[INNCPLAPRO]",
					BasicSearchExpression = "CAST([INNCPLAPRO] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[INNCPLAPRO]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				INNCPLAPRO.Init(this); // DN
				Fields.Add("INNCPLAPRO", INNCPLAPRO);

				// INNCCONFIR
				INNCCONFIR = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_INNCCONFIR",
					Name = "INNCCONFIR",
					Expression = "[INNCCONFIR]",
					BasicSearchExpression = "[INNCCONFIR]",
					Type = 11,
					DbType = SqlDbType.Bit,
					DateTimeFormat = -1,
					VirtualExpression = "[INNCCONFIR]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "CHECKBOX",
					Sortable = true, // Allow sort
					DataType = Config.DataTypeBoolean,
					OptionCount = 2,
					IsUpload = false
				};
				INNCCONFIR.Init(this); // DN
				INNCCONFIR.Lookup = new Lookup("INNCCONFIR", "INNCSUMPA", false, "", new List<string> {"", "", "", ""}, new List<string> {}, new List<string> {}, new List<string> {}, new List<string> {}, new List<string> {}, new List<string> {}, "", "");
				Fields.Add("INNCCONFIR", INNCCONFIR);

				// INNCAUTCONFCOMPEN
				INNCAUTCONFCOMPEN = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_INNCAUTCONFCOMPEN",
					Name = "INNCAUTCONFCOMPEN",
					Expression = "[INNCAUTCONFCOMPEN]",
					BasicSearchExpression = "[INNCAUTCONFCOMPEN]",
					Type = 202,
					DbType = SqlDbType.NVarChar,
					DateTimeFormat = -1,
					VirtualExpression = "[INNCAUTCONFCOMPEN]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					IsUpload = false
				};
				INNCAUTCONFCOMPEN.Init(this); // DN
				Fields.Add("INNCAUTCONFCOMPEN", INNCAUTCONFCOMPEN);

				// INNCAUTANULCOMPEN
				INNCAUTANULCOMPEN = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_INNCAUTANULCOMPEN",
					Name = "INNCAUTANULCOMPEN",
					Expression = "[INNCAUTANULCOMPEN]",
					BasicSearchExpression = "[INNCAUTANULCOMPEN]",
					Type = 202,
					DbType = SqlDbType.NVarChar,
					DateTimeFormat = -1,
					VirtualExpression = "[INNCAUTANULCOMPEN]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					IsUpload = false
				};
				INNCAUTANULCOMPEN.Init(this); // DN
				Fields.Add("INNCAUTANULCOMPEN", INNCAUTANULCOMPEN);

				// ISCINTERCOMPEN
				ISCINTERCOMPEN = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCINTERCOMPEN",
					Name = "ISCINTERCOMPEN",
					Expression = "[ISCINTERCOMPEN]",
					BasicSearchExpression = "[ISCINTERCOMPEN]",
					Type = 11,
					DbType = SqlDbType.Bit,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCINTERCOMPEN]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "CHECKBOX",
					Sortable = true, // Allow sort
					DataType = Config.DataTypeBoolean,
					OptionCount = 2,
					IsUpload = false
				};
				ISCINTERCOMPEN.Init(this); // DN
				ISCINTERCOMPEN.Lookup = new Lookup("ISCINTERCOMPEN", "INNCSUMPA", false, "", new List<string> {"", "", "", ""}, new List<string> {}, new List<string> {}, new List<string> {}, new List<string> {}, new List<string> {}, new List<string> {}, "", "");
				Fields.Add("ISCINTERCOMPEN", ISCINTERCOMPEN);

				// ISCMEDREMICOMPEN
				ISCMEDREMICOMPEN = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCMEDREMICOMPEN",
					Name = "ISCMEDREMICOMPEN",
					Expression = "[ISCMEDREMICOMPEN]",
					BasicSearchExpression = "[ISCMEDREMICOMPEN]",
					Type = 202,
					DbType = SqlDbType.NVarChar,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCMEDREMICOMPEN]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					IsUpload = false
				};
				ISCMEDREMICOMPEN.Init(this); // DN
				Fields.Add("ISCMEDREMICOMPEN", ISCMEDREMICOMPEN);

				// ISCNUMMESCOMPEN
				ISCNUMMESCOMPEN = new DbField<SqlDbType> {
					TableVar = "INNCSUMPA",
					TableName = "INNCSUMPA",
					FieldVar = "x_ISCNUMMESCOMPEN",
					Name = "ISCNUMMESCOMPEN",
					Expression = "[ISCNUMMESCOMPEN]",
					BasicSearchExpression = "CAST([ISCNUMMESCOMPEN] AS NVARCHAR)",
					Type = 3,
					DbType = SqlDbType.Int,
					DateTimeFormat = -1,
					VirtualExpression = "[ISCNUMMESCOMPEN]",
					IsVirtual = false,
					ForceSelection = false,
					SelectMultiple = false,
					VirtualSearch = false,
					ViewTag = "FORMATTED TEXT",
					HtmlTag = "TEXT",
					Sortable = true, // Allow sort
					DefaultErrorMessage = Language.Phrase("IncorrectInteger"),
					IsUpload = false
				};
				ISCNUMMESCOMPEN.Init(this); // DN
				Fields.Add("ISCNUMMESCOMPEN", ISCNUMMESCOMPEN);
			}

			// Set Field Visibility
			public override bool GetFieldVisibility(string fldname) {
				var fld = FieldByName(fldname);
				return fld.Visible; // Returns original value
			}

			// Invoke method // DN
			public object Invoke(string name, object[] parameters = null) {
				MethodInfo mi = this.GetType().GetMethod(name);
				if (mi != null) {
					if (IsAsyncMethod(mi)) {
						return InvokeAsync(mi, parameters).GetAwaiter().GetResult();
					} else {
						return mi.Invoke(this, parameters);
					}
				}
				return null;
			}

			// Invoke async method // DN
			public async Task<object> InvokeAsync(MethodInfo mi, object[] parameters = null) {
				if (mi != null) {
					dynamic awaitable = mi.Invoke(this, parameters);
					await awaitable;
					return awaitable.GetAwaiter().GetResult();
				}
				return null;
			}

			#pragma warning disable 1998

			// Invoke async method // DN
			public async Task<object> InvokeAsync(string name, object[] parameters = null) => InvokeAsync(this.GetType().GetMethod(name), parameters);

			#pragma warning restore 1998

			// Check if Invoke async method // DN
			public bool IsAsyncMethod(MethodInfo mi) {
				if (mi != null) {
					Type attType = typeof(AsyncStateMachineAttribute);
					var attrib = (AsyncStateMachineAttribute)mi.GetCustomAttribute(attType);
					return (attrib != null);
				}
				return false;
			}

			// Check if Invoke async method // DN
			public bool IsAsyncMethod(string name) => IsAsyncMethod(this.GetType().GetMethod(name));

			#pragma warning disable 618

			// Connection
			public virtual DatabaseConnectionBase<SqlConnection, SqlCommand, SqlDataReader, SqlDbType> Connection => GetConnection(DbId);

			#pragma warning restore 618

			// Set left column class (must be predefined col-*-* classes of Bootstrap grid system)
			public void SetLeftColumnClass(string columnClass) {
				Match m = Regex.Match(columnClass, @"^col\-(\w+)\-(\d+)$");
				if (m.Success) {
					LeftColumnClass = columnClass + " col-form-label ew-label";
					RightColumnClass = "col-" + m.Groups[1].Value + "-" + Convert.ToString(12 - ConvertToInt(m.Groups[2].Value));
					OffsetColumnClass = RightColumnClass + " " + columnClass.Replace("col-", "offset-");
					TableLeftColumnClass = Regex.Replace(columnClass, @"/^col-\w+-(\d+)$/", "w-col-$1"); // Change to w-col-*
				}
			}

			// Single column sort
			public void UpdateSort(DbField fld) {
				string lastSort, sortField, thisSort;
				if (CurrentOrder == fld.Name) {
					sortField = fld.Expression;
					lastSort = fld.Sort;
					if (CurrentOrderType == "ASC" || CurrentOrderType == "DESC") {
						thisSort = CurrentOrderType;
					} else {
						thisSort = (lastSort == "ASC") ? "DESC" : "ASC";
					}
					fld.Sort = thisSort;
					SessionOrderBy = sortField + " " + thisSort; // Save to Session
				} else {
					fld.Sort = "";
				}
			}

			// WHERE // DN
			private string _sqlWhere = null;
			public string SqlWhere {
				get {
					string where = "";
					return _sqlWhere ?? where;
				}
				set {
					_sqlWhere = value;
				}
			}

			// Group By
			private string _sqlGroupBy = null;
			public string SqlGroupBy {
				get => _sqlGroupBy ?? "";
				set => _sqlGroupBy = value;
			}

			// Having
			private string _sqlHaving = null;
			public string SqlHaving {
				get => _sqlHaving ?? "";
				set => _sqlHaving = value;
			}

			// Apply User ID filters
			public string ApplyUserIDFilters(string filter) {
				return filter;
			}

			// Check if User ID security allows view all
			public bool UserIDAllow(string id = "") {
				int allow = Config.UserIdAllow;
				switch (id) {
					case "add":
					case "copy":
					case "gridadd":
					case "register":
					case "addopt":
						return ((allow & 1) == 1);
					case "edit":
					case "gridedit":
					case "update":
					case "changepwd":
					case "forgotpwd":
						return ((allow & 4) == 4);
					case "delete":
						return ((allow & 2) == 2);
					case "view":
						return ((allow & 32) == 32);
					case "search":
						return ((allow & 64) == 64);
					default:
						return ((allow & 8) == 8);
				}
			}

			// Get record count by reading data reader
			public async Task<int> GetRecordCount(string sql) { // use by Lookup // DN
				try {
					var cnt = 0;
					using (var dr = await Connection.OpenDataReaderAsync(sql)) {
						while (await dr.ReadAsync())
							cnt++;
					}
					return cnt;
				} catch {
					if (Config.Debug)
						throw;
					return -1;
				}
			}

			// Try to get record count by SELECT COUNT(*)
			public async Task<int> TryGetRecordCount(string sql) {
				string orderBy = OrderBy;
				sql = Regex.Replace(sql, @"/\*BeginOrderBy\*/[\s\S]+/\*EndOrderBy\*/", "", RegexOptions.IgnoreCase).Trim(); // Remove ORDER BY clause (MSSQL)
				if (!string.IsNullOrEmpty(orderBy) && sql.EndsWith(orderBy))
					sql = sql.Substring(0, sql.Length - orderBy.Length); // Remove ORDER BY clause
				try {
					string sqlcnt;
					if ((new List<string> { "TABLE", "VIEW", "LINKTABLE" }).Contains(Type) && sql.StartsWith(SqlSelect)) { // Handle Custom Field
						sqlcnt = "SELECT COUNT(*) FROM " + SqlFrom + sql.Substring(SqlSelect.Length);
					} else {
						sqlcnt = "SELECT COUNT(*) FROM (" + sql + ") EW_COUNT_TABLE";
					}
					return Convert.ToInt32(await Connection.ExecuteScalarAsync(sqlcnt));
				} catch {
					return await GetRecordCount(sql);
				}
			}

			// Get ORDER BY clause
			public string OrderBy {
				get {
					string sort = SessionOrderBy;
					return BuildSelectSql("", "", "", "", SqlOrderBy, "", sort);
				}
			}

			// SELECT
			private string _sqlSelect = null;
			public string SqlSelect { // Select
				get => _sqlSelect ?? "SELECT * FROM " + SqlFrom;
				set => _sqlSelect = value;
			}

			// Table level SQL
			// FROM

			private string _sqlFrom = null;
			public string SqlFrom {
				get => _sqlFrom ?? "[dbo].[INNCSUMPA]";
				set => _sqlFrom = value;
			}

			// Order By
			private string _sqlOrderBy = null;
			public string SqlOrderBy {
				get => _sqlOrderBy ?? "";
				set => _sqlOrderBy = value;
			}

			// Get SQL
			public string GetSql(string where, string orderBy = "") => BuildSelectSql(SqlSelect, SqlWhere, SqlGroupBy, SqlHaving, SqlOrderBy, where, orderBy);

			// Table SQL
			public string CurrentSql {
				get {
					string filter = CurrentFilter;
					string sort = SessionOrderBy;
					return GetSql(filter, sort);
				}
			}

			// Table SQL with List page filter
			public string ListSql {
				get {
					string sort = "";
					string select = "";
					string filter = UseSessionForListSql ? SessionWhere : "";
					AddFilter(ref filter, CurrentFilter);
					Recordset_Selecting(ref filter);
					select = SqlSelect;
					sort = UseSessionForListSql ? SessionOrderBy : "";
					return BuildSelectSql(select, SqlWhere, SqlGroupBy, SqlHaving, SqlOrderBy, filter, sort);
				}
			}

			// Get record count based on filter (for detail record count in master table pages)
			public async Task<int> LoadRecordCount(string filter) => await TryGetRecordCount(GetSql(filter));

			// Get record count (for current List page)
			public async Task<int> ListRecordCount() => await TryGetRecordCount(ListSql);

			// Insert
			public async Task<int> InsertAsync(Dictionary<string, object> row) {
				int result;
				var r = row.Where(kvp => {
					var fld = FieldByName(kvp.Key);
					return (fld != null && !fld.IsCustom);
				}).ToDictionary(kvp => kvp.Key, kvp => kvp.Value);
				var fields = r.Select(kvp => Fields[kvp.Key]);
				var names = String.Join(",", fields.Select(fld => fld.Expression));
				var values = String.Join(",", fields.Select(fld => SqlParameter(fld)));
				if (Empty(names))
					return -1;
				string sql = "INSERT INTO " + UpdateTable + " (" + names + ") VALUES (" + values + ")";
				using (var command = Connection.GetCommand(sql)) {
					foreach (var (key, value) in r) {
						var fld = (DbField<SqlDbType>)Fields[key]; // DN
						try {
							command.Parameters.Add(fld.FieldVar, fld.DbType).Value = ParameterValue(fld, value);
						} catch {
							if (Config.Debug)
								throw;
						}
					}
					result = await command.ExecuteNonQueryAsync();
				}
				if (result > 0) {
				}
				return result;
			}

			// Insert
			public int Insert(Dictionary<string, object> row) => InsertAsync(row).GetAwaiter().GetResult();

			// Update

			#pragma warning disable 168, 219

			public async Task<int> UpdateAsync(Dictionary<string, object> row, object where = null, Dictionary<string, object> rsold = null, bool curfilter = true) {
				int result;
				var rscascade = new Dictionary<string, object>();
				string whereClause = "";
				row = row.Where(kvp => {
					var fld = FieldByName(kvp.Key);
					return fld != null && !fld.IsCustom;
				}).ToDictionary(kvp => kvp.Key, kvp => kvp.Value);
				var fields = row.Select(kvp => Fields[kvp.Key]);
				var values = String.Join(",", fields.Select(fld => fld.Expression + "=" + SqlParameter(fld)));
				if (Empty(values))
					return -1;
				string sql = "UPDATE " + UpdateTable + " SET " + values;
				string filter = curfilter ? CurrentFilter : "";
				if (IsDictionary(where))
					whereClause = ArrayToFilter((IDictionary<string, object>)where);
				else
					whereClause = (string)where;
				AddFilter(ref filter, whereClause);
				if (!Empty(filter))
					sql += " WHERE " + filter;
				using (var command = Connection.GetCommand(sql)) {
					foreach (var (key, value) in row) {
						var fld = (DbField<SqlDbType>)Fields[key]; // DN
						try {
							command.Parameters.Add(fld.FieldVar, fld.DbType).Value = ParameterValue(fld, value);
						} catch {
							if (Config.Debug)
								throw;
						}
					}
					result = await command.ExecuteNonQueryAsync();
				}
				return result;
			}

			#pragma warning restore 168, 219

			// Update
			public int Update(Dictionary<string, object> row, object where = null, Dictionary<string, object> rsold = null, bool curfilter = true)
				=> UpdateAsync(row, where, rsold, curfilter).GetAwaiter().GetResult();

			// Convert to parameter name for use in SQL
			public string SqlParameter(DbField fld) {
				string symbol = GetSqlParamSymbol(DbId);
				string value = symbol;
				if (symbol != "?")
					value += fld.FieldVar;
				return value;
			}

			// Convert value to object for parameter
			public object ParameterValue(DbField fld, object value) {
				if (((DbField<SqlDbType>)fld).DbType == SqlDbType.Bit) {
					return ConvertToBool(value);
				}
				return value;
			}

			#pragma warning disable 168, 1998

			// Delete
			public async Task<int> DeleteAsync(Dictionary<string, object> row, object where = null, bool curfilter = true) {
				bool delete = true;
				string whereClause = "";
				string sql = "DELETE FROM " + UpdateTable + " WHERE ";
				string filter = curfilter ? CurrentFilter : "";
				if (IsDictionary(where))
					whereClause = ArrayToFilter((IDictionary<string, object>)where);
				else
					whereClause = (string)where;
				AddFilter(ref filter, whereClause);
				if (row != null) {
					DbField fld;
					fld = FieldByName("OID");
					AddFilter(ref filter, fld.Expression + "=" + QuotedValue(row["OID"], FieldByName("OID").DataType, DbId));
				}
				if (!Empty(filter))
					sql += filter;
				else
					sql += "0=1"; // Avoid delete
				int result = -1;
				if (delete)
					result = await Connection.ExecuteAsync(sql);
				return result;
			}

			#pragma warning restore 168, 1998

			// Delete
			public int Delete(Dictionary<string, object> row, object where = null, bool curfilter = true) =>
				DeleteAsync(row, where, curfilter).GetAwaiter().GetResult();

			// Load DbValue from recordset
			public void LoadDbValues(Dictionary<string, object> row) {
				if (row == null)
					return;
				OID.SetDbValue(row["OID"], false);
				ADNINGRESO.SetDbValue(row["ADNINGRESO"], false);
				SLNORDSER.SetDbValue(row["SLNORDSER"], false);
				ISCESTPRO.SetDbValue(row["ISCESTPRO"], false);
				GEENMedico.SetDbValue(row["GEENMedico"], false);
				INNALMACE.SetDbValue(row["INNALMACE"], false);
				GENARESER.SetDbValue(row["GENARESER"], false);
				ISCDETALL.SetDbValue(row["ISCDETALL"], false);
				GENARESER1.SetDbValue(row["GENARESER1"], false);
				ISCSUMIORIGEN.SetDbValue(row["ISCSUMIORIGEN"], false);
				ISCSUMIPENDI.SetDbValue(row["ISCSUMIPENDI"], false);
				INNORDDESC.SetDbValue(row["INNORDDESC"], false);
				ISCSUMGENPEN.SetDbValue((ConvertToBool(row["ISCSUMGENPEN"]) ? "1" : "0"), false);
				ISCVRBASINC.SetDbValue(row["ISCVRBASINC"], false);
				ISCPORINCRE.SetDbValue(row["ISCPORINCRE"], false);
				ISCPORINCRE1.SetDbValue(row["ISCPORINCRE1"], false);
				ISCVALINCRE.SetDbValue(row["ISCVALINCRE"], false);
				ISCVALINCRE1.SetDbValue(row["ISCVALINCRE1"], false);
				ISCOIDORIHCRE.SetDbValue(row["ISCOIDORIHCRE"], false);
				ISCTIPSOLDIS.SetDbValue(row["ISCTIPSOLDIS"], false);
				INNDISFORREC.SetDbValue(row["INNDISFORREC"], false);
				INNPENDICAB.SetDbValue(row["INNPENDICAB"], false);
				ISCINDIDESA.SetDbValue((ConvertToBool(row["ISCINDIDESA"]) ? "1" : "0"), false);
				ISCJUSTIFICA.SetDbValue(row["ISCJUSTIFICA"], false);
				ISCFECORIGEN.SetDbValue(row["ISCFECORIGEN"], false);
				ISCGFMIDFOR.SetDbValue(row["ISCGFMIDFOR"], false);
				INNCPLAPRO.SetDbValue(row["INNCPLAPRO"], false);
				INNCCONFIR.SetDbValue((ConvertToBool(row["INNCCONFIR"]) ? "1" : "0"), false);
				INNCAUTCONFCOMPEN.SetDbValue(row["INNCAUTCONFCOMPEN"], false);
				INNCAUTANULCOMPEN.SetDbValue(row["INNCAUTANULCOMPEN"], false);
				ISCINTERCOMPEN.SetDbValue((ConvertToBool(row["ISCINTERCOMPEN"]) ? "1" : "0"), false);
				ISCMEDREMICOMPEN.SetDbValue(row["ISCMEDREMICOMPEN"], false);
				ISCNUMMESCOMPEN.SetDbValue(row["ISCNUMMESCOMPEN"], false);
			}
			public void DeleteUploadedFiles(Dictionary<string, object> row) {
				LoadDbValues(row);
			}

			// Return URL
			public string ReturnUrl {
				get {
					string name = Config.ProjectName + "_" + TableVar + "_" + Config.TableReturnUrl;

					// Get referer URL automatically
					if (!Empty(ReferUrl()) && ReferPage() != CurrentPageName() &&
						ReferPage() != "login") {// Referer not same page or login page
							Session[name] = ReferUrl(); // Save to Session
					}
					if (!Empty(Session[name])) {
						return Session.GetString(name);
					} else {
						return "INNCSUMPAlist";
					}
				}
				set {
					Session[Config.ProjectName + "_" + TableVar + "_" + Config.TableReturnUrl] = value;
				}
			}

			// Get modal caption
			public string GetModalCaption(string pageName) {
				if (SameString(pageName, "INNCSUMPAview"))
					return Language.Phrase("View");
				else if (SameString(pageName, "INNCSUMPAedit"))
					return Language.Phrase("Edit");
				else if (SameString(pageName, "INNCSUMPAadd"))
					return Language.Phrase("Add");
				else
					return "";
			}

			// List URL
			public string ListUrl => "INNCSUMPAlist";

			// View URL
			public string ViewUrl => GetViewUrl();

			// View URL
			public string GetViewUrl(string parm = "") {
				string url = "";
				if (!Empty(parm))
					url = KeyUrl("INNCSUMPAview", UrlParm(parm));
				else
					url = KeyUrl("INNCSUMPAview", UrlParm(Config.TableShowDetail + "="));
				return AddMasterUrl(url);
			}

			// Add URL
			public string AddUrl { get; set; } = "INNCSUMPAadd";

			// Add URL
			public string GetAddUrl(string parm = "") {
				string url = "";
				if (!Empty(parm))
					url = "INNCSUMPAadd?" + UrlParm(parm);
				else
					url = "INNCSUMPAadd";
				return AppPath(AddMasterUrl(url));
			}

			// Edit URL
			public string EditUrl => GetEditUrl();

			// Edit URL (with parameter)
			public string GetEditUrl(string parm = "") {
				string url = "";
				url = KeyUrl("INNCSUMPAedit", UrlParm(parm));
				return AppPath(AddMasterUrl(url)); // DN
			}

			// Inline edit URL
			public string InlineEditUrl =>
				AppPath(AddMasterUrl(KeyUrl(CurrentPageName(), UrlParm("action=edit")))); // DN

			// Copy URL
			public string CopyUrl => GetCopyUrl();

			// Copy URL
			public string GetCopyUrl(string parm = "") {
				string url = "";
				url = KeyUrl("INNCSUMPAadd", UrlParm(parm));
				return AppPath(AddMasterUrl(url)); // DN
			}

			// Inline copy URL
			public string InlineCopyUrl =>
				AppPath(AddMasterUrl(KeyUrl(CurrentPageName(), UrlParm("action=copy")))); // DN

			// Delete URL
			public string DeleteUrl =>
				AppPath(KeyUrl("INNCSUMPAdelete", UrlParm())); // DN

			// Add master URL
			public string AddMasterUrl(string url) {
				return url;
			}

			// Get primary key as JSON
			public string KeyToJson() {
				string json = "";
				json += "OID:" + ConvertToJson(OID.CurrentValue, "number", true);
				return "{" + json + "}";
			}

			// Add key value to URL
			public string KeyUrl(string url, string parm = "") { // DN
				if (!IsDBNull(OID.CurrentValue)) {
					url += "/" + OID.CurrentValue;
				} else {
					return "javascript:ew.alert(ew.language.phrase('InvalidRecord'));";
				}
				if (Empty(parm))
					return url;
				else
					return url + "?" + parm;
			}

			// Sort URL (already URL-encoded)
			public string SortUrl(DbField fld) {
				if (!Empty(CurrentAction) || !Empty(Export) ||
					(new List<int> {141, 201, 203, 128, 204, 205}).Contains(fld.Type)) { // Unsortable data type
					return "";
				} else if (fld.Sortable) {
					string urlParm = UrlParm("order=" + UrlEncode(fld.Name) + "&amp;ordertype=" + fld.ReverseSort());
					return AddMasterUrl(CurrentPageName() + "?" + urlParm);
				}
				return "";
			}

			#pragma warning disable 168

			// Get record keys
			public List<string> GetRecordKeys() {
				var result = new List<string>();
				StringValues sv;
				var keysList = new List<string>();
				if (Form.TryGetValue("key_m", out sv) || Query.TryGetValue("key_m", out sv)) {
					keysList = sv.ToList();
				} else if (RouteValues.Count > 0 || Query.Count > 0 || Form.Count > 0) { // DN
					string key = "";
					string[] keyValues = null;
					object rv;
					if (IsApi() && RouteValues.TryGetValue("key", out object k))
						keyValues = k.ToString().Split('/');
					if (RouteValues.TryGetValue("OID", out rv)) { // OID
						key = Convert.ToString(rv);
					} else if (IsApi() && !Empty(keyValues)) {
						key = keyValues[0];
					} else {
						key = Param("OID");
					}
					keysList.Add(key);
				}

				// Check keys
				foreach (var keys in keysList) {
					if (!IsNumeric(keys)) // OID
						continue;
					result.Add(keys);
				}
				return result;
			}

			#pragma warning restore 168

			// Get filter from record keys
			public string GetFilterFromRecordKeys() {
				List<string> recordKeys = GetRecordKeys();
				string keyFilter = "";
				foreach (var keys in recordKeys) {
					if (!Empty(keyFilter))
						keyFilter += " OR ";
					OID.CurrentValue = keys;
					keyFilter += "(" + GetRecordFilter() + ")";
				}
				return keyFilter;
			}

			#pragma warning disable 618

			// Load rows based on filter // DN
			public async Task<DbDataReader> LoadRs(string filter, DatabaseConnectionBase<SqlConnection, SqlCommand, SqlDataReader, SqlDbType> conn = null) {

				// Set up filter (SQL WHERE clause) and get return SQL
				string sql = GetSql(filter);
				try {
					var dr = await (conn ?? Connection).OpenDataReaderAsync(sql);
					if (dr?.HasRows ?? false)
						return dr;
				} catch {}
				return null;
			}

			#pragma warning restore 618

			// Record filter WHERE clause
			private string _sqlKeyFilter => "[OID] = @OID@";

			#pragma warning disable 168

			// Get record filter
			public string GetRecordFilter(Dictionary<string, object> row = null)
			{
				string keyFilter = _sqlKeyFilter;
				object val, result;
				val = !Empty(row) ? (row.TryGetValue("OID", out result) ? result : null) : OID.CurrentValue;
				if (!IsNumeric(val))
					return "0=1"; // Invalid key
				if (val == null)
					return "0=1"; // Invalid key
				else
					keyFilter = keyFilter.Replace("@OID@", AdjustSql(val, DbId)); // Replace key value
				return keyFilter;
			}

			#pragma warning restore 168

			// Load row values from recordset
			public void LoadListRowValues(DbDataReader rs) {
				OID.SetDbValue(rs["OID"]);
				ADNINGRESO.SetDbValue(rs["ADNINGRESO"]);
				SLNORDSER.SetDbValue(rs["SLNORDSER"]);
				ISCESTPRO.SetDbValue(rs["ISCESTPRO"]);
				GEENMedico.SetDbValue(rs["GEENMedico"]);
				INNALMACE.SetDbValue(rs["INNALMACE"]);
				GENARESER.SetDbValue(rs["GENARESER"]);
				ISCDETALL.SetDbValue(rs["ISCDETALL"]);
				GENARESER1.SetDbValue(rs["GENARESER1"]);
				ISCSUMIORIGEN.SetDbValue(rs["ISCSUMIORIGEN"]);
				ISCSUMIPENDI.SetDbValue(rs["ISCSUMIPENDI"]);
				INNORDDESC.SetDbValue(rs["INNORDDESC"]);
				ISCSUMGENPEN.SetDbValue(ConvertToBool(rs["ISCSUMGENPEN"]) ? "1" : "0");
				ISCVRBASINC.SetDbValue(rs["ISCVRBASINC"]);
				ISCPORINCRE.SetDbValue(rs["ISCPORINCRE"]);
				ISCPORINCRE1.SetDbValue(rs["ISCPORINCRE1"]);
				ISCVALINCRE.SetDbValue(rs["ISCVALINCRE"]);
				ISCVALINCRE1.SetDbValue(rs["ISCVALINCRE1"]);
				ISCOIDORIHCRE.SetDbValue(rs["ISCOIDORIHCRE"]);
				ISCTIPSOLDIS.SetDbValue(rs["ISCTIPSOLDIS"]);
				INNDISFORREC.SetDbValue(rs["INNDISFORREC"]);
				INNPENDICAB.SetDbValue(rs["INNPENDICAB"]);
				ISCINDIDESA.SetDbValue(ConvertToBool(rs["ISCINDIDESA"]) ? "1" : "0");
				ISCJUSTIFICA.SetDbValue(rs["ISCJUSTIFICA"]);
				ISCFECORIGEN.SetDbValue(rs["ISCFECORIGEN"]);
				ISCGFMIDFOR.SetDbValue(rs["ISCGFMIDFOR"]);
				INNCPLAPRO.SetDbValue(rs["INNCPLAPRO"]);
				INNCCONFIR.SetDbValue(ConvertToBool(rs["INNCCONFIR"]) ? "1" : "0");
				INNCAUTCONFCOMPEN.SetDbValue(rs["INNCAUTCONFCOMPEN"]);
				INNCAUTANULCOMPEN.SetDbValue(rs["INNCAUTANULCOMPEN"]);
				ISCINTERCOMPEN.SetDbValue(ConvertToBool(rs["ISCINTERCOMPEN"]) ? "1" : "0");
				ISCMEDREMICOMPEN.SetDbValue(rs["ISCMEDREMICOMPEN"]);
				ISCNUMMESCOMPEN.SetDbValue(rs["ISCNUMMESCOMPEN"]);
			}

			#pragma warning disable 1998

			// Render list row values
			public async Task RenderListRow() {

				// Call Row Rendering event
				Row_Rendering();

				// Common render codes
				// OID
				// ADNINGRESO
				// SLNORDSER
				// ISCESTPRO
				// GEENMedico
				// INNALMACE
				// GENARESER
				// ISCDETALL
				// GENARESER1
				// ISCSUMIORIGEN
				// ISCSUMIPENDI
				// INNORDDESC
				// ISCSUMGENPEN
				// ISCVRBASINC
				// ISCPORINCRE
				// ISCPORINCRE1
				// ISCVALINCRE
				// ISCVALINCRE1
				// ISCOIDORIHCRE
				// ISCTIPSOLDIS
				// INNDISFORREC
				// INNPENDICAB
				// ISCINDIDESA
				// ISCJUSTIFICA
				// ISCFECORIGEN
				// ISCGFMIDFOR
				// INNCPLAPRO
				// INNCCONFIR
				// INNCAUTCONFCOMPEN
				// INNCAUTANULCOMPEN
				// ISCINTERCOMPEN
				// ISCMEDREMICOMPEN
				// ISCNUMMESCOMPEN
				// OID

				OID.ViewValue = FormatNumber(OID.ViewValue, 0, -2, -2, -2);

				// ADNINGRESO
				ADNINGRESO.ViewValue = ADNINGRESO.CurrentValue;
				ADNINGRESO.ViewValue = FormatNumber(ADNINGRESO.ViewValue, 0, -2, -2, -2);

				// SLNORDSER
				SLNORDSER.ViewValue = SLNORDSER.CurrentValue;
				SLNORDSER.ViewValue = FormatNumber(SLNORDSER.ViewValue, 0, -2, -2, -2);

				// ISCESTPRO
				ISCESTPRO.ViewValue = ISCESTPRO.CurrentValue;
				ISCESTPRO.ViewValue = FormatNumber(ISCESTPRO.ViewValue, 0, -2, -2, -2);

				// GEENMedico
				GEENMedico.ViewValue = GEENMedico.CurrentValue;
				GEENMedico.ViewValue = FormatNumber(GEENMedico.ViewValue, 0, -2, -2, -2);

				// INNALMACE
				INNALMACE.ViewValue = INNALMACE.CurrentValue;
				INNALMACE.ViewValue = FormatNumber(INNALMACE.ViewValue, 0, -2, -2, -2);

				// GENARESER
				GENARESER.ViewValue = GENARESER.CurrentValue;
				GENARESER.ViewValue = FormatNumber(GENARESER.ViewValue, 0, -2, -2, -2);

				// ISCDETALL
				ISCDETALL.ViewValue = ISCDETALL.CurrentValue;

				// GENARESER1
				GENARESER1.ViewValue = GENARESER1.CurrentValue;
				GENARESER1.ViewValue = FormatNumber(GENARESER1.ViewValue, 0, -2, -2, -2);

				// ISCSUMIORIGEN
				ISCSUMIORIGEN.ViewValue = ISCSUMIORIGEN.CurrentValue;
				ISCSUMIORIGEN.ViewValue = FormatNumber(ISCSUMIORIGEN.ViewValue, 0, -2, -2, -2);

				// ISCSUMIPENDI
				ISCSUMIPENDI.ViewValue = ISCSUMIPENDI.CurrentValue;
				ISCSUMIPENDI.ViewValue = FormatNumber(ISCSUMIPENDI.ViewValue, 0, -2, -2, -2);

				// INNORDDESC
				INNORDDESC.ViewValue = INNORDDESC.CurrentValue;
				INNORDDESC.ViewValue = FormatNumber(INNORDDESC.ViewValue, 0, -2, -2, -2);

				// ISCSUMGENPEN
				if (ConvertToBool(ISCSUMGENPEN.CurrentValue)) {
					ISCSUMGENPEN.ViewValue = (ISCSUMGENPEN.TagCaption(1) != "") ? ISCSUMGENPEN.TagCaption(1) : "Yes";
				} else {
					ISCSUMGENPEN.ViewValue = (ISCSUMGENPEN.TagCaption(2) != "") ? ISCSUMGENPEN.TagCaption(2) : "No";
				}

				// ISCVRBASINC
				ISCVRBASINC.ViewValue = ISCVRBASINC.CurrentValue;
				ISCVRBASINC.ViewValue = FormatNumber(ISCVRBASINC.ViewValue, 2, -2, -2, -2);

				// ISCPORINCRE
				ISCPORINCRE.ViewValue = ISCPORINCRE.CurrentValue;
				ISCPORINCRE.ViewValue = FormatNumber(ISCPORINCRE.ViewValue, 2, -2, -2, -2);

				// ISCPORINCRE1
				ISCPORINCRE1.ViewValue = ISCPORINCRE1.CurrentValue;
				ISCPORINCRE1.ViewValue = FormatNumber(ISCPORINCRE1.ViewValue, 2, -2, -2, -2);

				// ISCVALINCRE
				ISCVALINCRE.ViewValue = ISCVALINCRE.CurrentValue;
				ISCVALINCRE.ViewValue = FormatNumber(ISCVALINCRE.ViewValue, 2, -2, -2, -2);

				// ISCVALINCRE1
				ISCVALINCRE1.ViewValue = ISCVALINCRE1.CurrentValue;
				ISCVALINCRE1.ViewValue = FormatNumber(ISCVALINCRE1.ViewValue, 2, -2, -2, -2);

				// ISCOIDORIHCRE
				ISCOIDORIHCRE.ViewValue = ISCOIDORIHCRE.CurrentValue;
				ISCOIDORIHCRE.ViewValue = FormatNumber(ISCOIDORIHCRE.ViewValue, 0, -2, -2, -2);

				// ISCTIPSOLDIS
				ISCTIPSOLDIS.ViewValue = ISCTIPSOLDIS.CurrentValue;
				ISCTIPSOLDIS.ViewValue = FormatNumber(ISCTIPSOLDIS.ViewValue, 0, -2, -2, -2);

				// INNDISFORREC
				INNDISFORREC.ViewValue = INNDISFORREC.CurrentValue;
				INNDISFORREC.ViewValue = FormatNumber(INNDISFORREC.ViewValue, 0, -2, -2, -2);

				// INNPENDICAB
				INNPENDICAB.ViewValue = INNPENDICAB.CurrentValue;
				INNPENDICAB.ViewValue = FormatNumber(INNPENDICAB.ViewValue, 0, -2, -2, -2);

				// ISCINDIDESA
				if (ConvertToBool(ISCINDIDESA.CurrentValue)) {
					ISCINDIDESA.ViewValue = (ISCINDIDESA.TagCaption(1) != "") ? ISCINDIDESA.TagCaption(1) : "Yes";
				} else {
					ISCINDIDESA.ViewValue = (ISCINDIDESA.TagCaption(2) != "") ? ISCINDIDESA.TagCaption(2) : "No";
				}

				// ISCJUSTIFICA
				ISCJUSTIFICA.ViewValue = ISCJUSTIFICA.CurrentValue;

				// ISCFECORIGEN
				ISCFECORIGEN.ViewValue = ISCFECORIGEN.CurrentValue;
				ISCFECORIGEN.ViewValue = FormatDateTime(ISCFECORIGEN.ViewValue, 0);

				// ISCGFMIDFOR
				ISCGFMIDFOR.ViewValue = ISCGFMIDFOR.CurrentValue;

				// INNCPLAPRO
				INNCPLAPRO.ViewValue = INNCPLAPRO.CurrentValue;
				INNCPLAPRO.ViewValue = FormatNumber(INNCPLAPRO.ViewValue, 0, -2, -2, -2);

				// INNCCONFIR
				if (ConvertToBool(INNCCONFIR.CurrentValue)) {
					INNCCONFIR.ViewValue = (INNCCONFIR.TagCaption(1) != "") ? INNCCONFIR.TagCaption(1) : "Yes";
				} else {
					INNCCONFIR.ViewValue = (INNCCONFIR.TagCaption(2) != "") ? INNCCONFIR.TagCaption(2) : "No";
				}

				// INNCAUTCONFCOMPEN
				INNCAUTCONFCOMPEN.ViewValue = INNCAUTCONFCOMPEN.CurrentValue;

				// INNCAUTANULCOMPEN
				INNCAUTANULCOMPEN.ViewValue = INNCAUTANULCOMPEN.CurrentValue;

				// ISCINTERCOMPEN
				if (ConvertToBool(ISCINTERCOMPEN.CurrentValue)) {
					ISCINTERCOMPEN.ViewValue = (ISCINTERCOMPEN.TagCaption(1) != "") ? ISCINTERCOMPEN.TagCaption(1) : "Yes";
				} else {
					ISCINTERCOMPEN.ViewValue = (ISCINTERCOMPEN.TagCaption(2) != "") ? ISCINTERCOMPEN.TagCaption(2) : "No";
				}

				// ISCMEDREMICOMPEN
				ISCMEDREMICOMPEN.ViewValue = ISCMEDREMICOMPEN.CurrentValue;

				// ISCNUMMESCOMPEN
				ISCNUMMESCOMPEN.ViewValue = ISCNUMMESCOMPEN.CurrentValue;
				ISCNUMMESCOMPEN.ViewValue = FormatNumber(ISCNUMMESCOMPEN.ViewValue, 0, -2, -2, -2);

				// OID
				OID.HrefValue = "";
				OID.TooltipValue = "";

				// ADNINGRESO
				ADNINGRESO.HrefValue = "";
				ADNINGRESO.TooltipValue = "";

				// SLNORDSER
				SLNORDSER.HrefValue = "";
				SLNORDSER.TooltipValue = "";

				// ISCESTPRO
				ISCESTPRO.HrefValue = "";
				ISCESTPRO.TooltipValue = "";

				// GEENMedico
				GEENMedico.HrefValue = "";
				GEENMedico.TooltipValue = "";

				// INNALMACE
				INNALMACE.HrefValue = "";
				INNALMACE.TooltipValue = "";

				// GENARESER
				GENARESER.HrefValue = "";
				GENARESER.TooltipValue = "";

				// ISCDETALL
				ISCDETALL.HrefValue = "";
				ISCDETALL.TooltipValue = "";

				// GENARESER1
				GENARESER1.HrefValue = "";
				GENARESER1.TooltipValue = "";

				// ISCSUMIORIGEN
				ISCSUMIORIGEN.HrefValue = "";
				ISCSUMIORIGEN.TooltipValue = "";

				// ISCSUMIPENDI
				ISCSUMIPENDI.HrefValue = "";
				ISCSUMIPENDI.TooltipValue = "";

				// INNORDDESC
				INNORDDESC.HrefValue = "";
				INNORDDESC.TooltipValue = "";

				// ISCSUMGENPEN
				ISCSUMGENPEN.HrefValue = "";
				ISCSUMGENPEN.TooltipValue = "";

				// ISCVRBASINC
				ISCVRBASINC.HrefValue = "";
				ISCVRBASINC.TooltipValue = "";

				// ISCPORINCRE
				ISCPORINCRE.HrefValue = "";
				ISCPORINCRE.TooltipValue = "";

				// ISCPORINCRE1
				ISCPORINCRE1.HrefValue = "";
				ISCPORINCRE1.TooltipValue = "";

				// ISCVALINCRE
				ISCVALINCRE.HrefValue = "";
				ISCVALINCRE.TooltipValue = "";

				// ISCVALINCRE1
				ISCVALINCRE1.HrefValue = "";
				ISCVALINCRE1.TooltipValue = "";

				// ISCOIDORIHCRE
				ISCOIDORIHCRE.HrefValue = "";
				ISCOIDORIHCRE.TooltipValue = "";

				// ISCTIPSOLDIS
				ISCTIPSOLDIS.HrefValue = "";
				ISCTIPSOLDIS.TooltipValue = "";

				// INNDISFORREC
				INNDISFORREC.HrefValue = "";
				INNDISFORREC.TooltipValue = "";

				// INNPENDICAB
				INNPENDICAB.HrefValue = "";
				INNPENDICAB.TooltipValue = "";

				// ISCINDIDESA
				ISCINDIDESA.HrefValue = "";
				ISCINDIDESA.TooltipValue = "";

				// ISCJUSTIFICA
				ISCJUSTIFICA.HrefValue = "";
				ISCJUSTIFICA.TooltipValue = "";

				// ISCFECORIGEN
				ISCFECORIGEN.HrefValue = "";
				ISCFECORIGEN.TooltipValue = "";

				// ISCGFMIDFOR
				ISCGFMIDFOR.HrefValue = "";
				ISCGFMIDFOR.TooltipValue = "";

				// INNCPLAPRO
				INNCPLAPRO.HrefValue = "";
				INNCPLAPRO.TooltipValue = "";

				// INNCCONFIR
				INNCCONFIR.HrefValue = "";
				INNCCONFIR.TooltipValue = "";

				// INNCAUTCONFCOMPEN
				INNCAUTCONFCOMPEN.HrefValue = "";
				INNCAUTCONFCOMPEN.TooltipValue = "";

				// INNCAUTANULCOMPEN
				INNCAUTANULCOMPEN.HrefValue = "";
				INNCAUTANULCOMPEN.TooltipValue = "";

				// ISCINTERCOMPEN
				ISCINTERCOMPEN.HrefValue = "";
				ISCINTERCOMPEN.TooltipValue = "";

				// ISCMEDREMICOMPEN
				ISCMEDREMICOMPEN.HrefValue = "";
				ISCMEDREMICOMPEN.TooltipValue = "";

				// ISCNUMMESCOMPEN
				ISCNUMMESCOMPEN.HrefValue = "";
				ISCNUMMESCOMPEN.TooltipValue = "";

				// Call Row Rendered event
				Row_Rendered();

				// Save data for Custom Template
				Rows.Add(CustomTemplateFieldValues());
			}

			#pragma warning restore 1998

			#pragma warning disable 1998

			// Render edit row values
			public async Task RenderEditRow() {

				// Call Row Rendering event
				Row_Rendering();

				// OID
				OID.EditAttrs["class"] = "form-control";
				OID.EditValue = FormatNumber(OID.EditValue, 0, -2, -2, -2);

				// ADNINGRESO
				ADNINGRESO.EditAttrs["class"] = "form-control";
				ADNINGRESO.EditValue = ADNINGRESO.CurrentValue; // DN
				ADNINGRESO.PlaceHolder = RemoveHtml(ADNINGRESO.Caption);

				// SLNORDSER
				SLNORDSER.EditAttrs["class"] = "form-control";
				SLNORDSER.EditValue = SLNORDSER.CurrentValue; // DN
				SLNORDSER.PlaceHolder = RemoveHtml(SLNORDSER.Caption);

				// ISCESTPRO
				ISCESTPRO.EditAttrs["class"] = "form-control";
				ISCESTPRO.EditValue = ISCESTPRO.CurrentValue; // DN
				ISCESTPRO.PlaceHolder = RemoveHtml(ISCESTPRO.Caption);

				// GEENMedico
				GEENMedico.EditAttrs["class"] = "form-control";
				GEENMedico.EditValue = GEENMedico.CurrentValue; // DN
				GEENMedico.PlaceHolder = RemoveHtml(GEENMedico.Caption);

				// INNALMACE
				INNALMACE.EditAttrs["class"] = "form-control";
				INNALMACE.EditValue = INNALMACE.CurrentValue; // DN
				INNALMACE.PlaceHolder = RemoveHtml(INNALMACE.Caption);

				// GENARESER
				GENARESER.EditAttrs["class"] = "form-control";
				GENARESER.EditValue = GENARESER.CurrentValue; // DN
				GENARESER.PlaceHolder = RemoveHtml(GENARESER.Caption);

				// ISCDETALL
				ISCDETALL.EditAttrs["class"] = "form-control";
				ISCDETALL.EditValue = ISCDETALL.CurrentValue; // DN
				ISCDETALL.PlaceHolder = RemoveHtml(ISCDETALL.Caption);

				// GENARESER1
				GENARESER1.EditAttrs["class"] = "form-control";
				GENARESER1.EditValue = GENARESER1.CurrentValue; // DN
				GENARESER1.PlaceHolder = RemoveHtml(GENARESER1.Caption);

				// ISCSUMIORIGEN
				ISCSUMIORIGEN.EditAttrs["class"] = "form-control";
				ISCSUMIORIGEN.EditValue = ISCSUMIORIGEN.CurrentValue; // DN
				ISCSUMIORIGEN.PlaceHolder = RemoveHtml(ISCSUMIORIGEN.Caption);

				// ISCSUMIPENDI
				ISCSUMIPENDI.EditAttrs["class"] = "form-control";
				ISCSUMIPENDI.EditValue = ISCSUMIPENDI.CurrentValue; // DN
				ISCSUMIPENDI.PlaceHolder = RemoveHtml(ISCSUMIPENDI.Caption);

				// INNORDDESC
				INNORDDESC.EditAttrs["class"] = "form-control";
				INNORDDESC.EditValue = INNORDDESC.CurrentValue; // DN
				INNORDDESC.PlaceHolder = RemoveHtml(INNORDDESC.Caption);

				// ISCSUMGENPEN
				ISCSUMGENPEN.EditValue = ISCSUMGENPEN.Options(false);

				// ISCVRBASINC
				ISCVRBASINC.EditAttrs["class"] = "form-control";
				ISCVRBASINC.EditValue = ISCVRBASINC.CurrentValue; // DN
				ISCVRBASINC.PlaceHolder = RemoveHtml(ISCVRBASINC.Caption);
				if (!Empty(ISCVRBASINC.EditValue) && IsNumeric(ISCVRBASINC.EditValue))
					ISCVRBASINC.EditValue = FormatNumber(ISCVRBASINC.EditValue, -2, -2, -2, -2);

				// ISCPORINCRE
				ISCPORINCRE.EditAttrs["class"] = "form-control";
				ISCPORINCRE.EditValue = ISCPORINCRE.CurrentValue; // DN
				ISCPORINCRE.PlaceHolder = RemoveHtml(ISCPORINCRE.Caption);
				if (!Empty(ISCPORINCRE.EditValue) && IsNumeric(ISCPORINCRE.EditValue))
					ISCPORINCRE.EditValue = FormatNumber(ISCPORINCRE.EditValue, -2, -2, -2, -2);

				// ISCPORINCRE1
				ISCPORINCRE1.EditAttrs["class"] = "form-control";
				ISCPORINCRE1.EditValue = ISCPORINCRE1.CurrentValue; // DN
				ISCPORINCRE1.PlaceHolder = RemoveHtml(ISCPORINCRE1.Caption);
				if (!Empty(ISCPORINCRE1.EditValue) && IsNumeric(ISCPORINCRE1.EditValue))
					ISCPORINCRE1.EditValue = FormatNumber(ISCPORINCRE1.EditValue, -2, -2, -2, -2);

				// ISCVALINCRE
				ISCVALINCRE.EditAttrs["class"] = "form-control";
				ISCVALINCRE.EditValue = ISCVALINCRE.CurrentValue; // DN
				ISCVALINCRE.PlaceHolder = RemoveHtml(ISCVALINCRE.Caption);
				if (!Empty(ISCVALINCRE.EditValue) && IsNumeric(ISCVALINCRE.EditValue))
					ISCVALINCRE.EditValue = FormatNumber(ISCVALINCRE.EditValue, -2, -2, -2, -2);

				// ISCVALINCRE1
				ISCVALINCRE1.EditAttrs["class"] = "form-control";
				ISCVALINCRE1.EditValue = ISCVALINCRE1.CurrentValue; // DN
				ISCVALINCRE1.PlaceHolder = RemoveHtml(ISCVALINCRE1.Caption);
				if (!Empty(ISCVALINCRE1.EditValue) && IsNumeric(ISCVALINCRE1.EditValue))
					ISCVALINCRE1.EditValue = FormatNumber(ISCVALINCRE1.EditValue, -2, -2, -2, -2);

				// ISCOIDORIHCRE
				ISCOIDORIHCRE.EditAttrs["class"] = "form-control";
				ISCOIDORIHCRE.EditValue = ISCOIDORIHCRE.CurrentValue; // DN
				ISCOIDORIHCRE.PlaceHolder = RemoveHtml(ISCOIDORIHCRE.Caption);

				// ISCTIPSOLDIS
				ISCTIPSOLDIS.EditAttrs["class"] = "form-control";
				ISCTIPSOLDIS.EditValue = ISCTIPSOLDIS.CurrentValue; // DN
				ISCTIPSOLDIS.PlaceHolder = RemoveHtml(ISCTIPSOLDIS.Caption);

				// INNDISFORREC
				INNDISFORREC.EditAttrs["class"] = "form-control";
				INNDISFORREC.EditValue = INNDISFORREC.CurrentValue; // DN
				INNDISFORREC.PlaceHolder = RemoveHtml(INNDISFORREC.Caption);

				// INNPENDICAB
				INNPENDICAB.EditAttrs["class"] = "form-control";
				INNPENDICAB.EditValue = INNPENDICAB.CurrentValue; // DN
				INNPENDICAB.PlaceHolder = RemoveHtml(INNPENDICAB.Caption);

				// ISCINDIDESA
				ISCINDIDESA.EditValue = ISCINDIDESA.Options(false);

				// ISCJUSTIFICA
				ISCJUSTIFICA.EditAttrs["class"] = "form-control";
				ISCJUSTIFICA.EditValue = ISCJUSTIFICA.CurrentValue; // DN
				ISCJUSTIFICA.PlaceHolder = RemoveHtml(ISCJUSTIFICA.Caption);

				// ISCFECORIGEN
				ISCFECORIGEN.EditAttrs["class"] = "form-control";
				ISCFECORIGEN.EditValue = FormatDateTime(ISCFECORIGEN.CurrentValue, 8); // DN
				ISCFECORIGEN.PlaceHolder = RemoveHtml(ISCFECORIGEN.Caption);

				// ISCGFMIDFOR
				ISCGFMIDFOR.EditAttrs["class"] = "form-control";
				ISCGFMIDFOR.EditValue = ISCGFMIDFOR.CurrentValue; // DN
				ISCGFMIDFOR.PlaceHolder = RemoveHtml(ISCGFMIDFOR.Caption);

				// INNCPLAPRO
				INNCPLAPRO.EditAttrs["class"] = "form-control";
				INNCPLAPRO.EditValue = INNCPLAPRO.CurrentValue; // DN
				INNCPLAPRO.PlaceHolder = RemoveHtml(INNCPLAPRO.Caption);

				// INNCCONFIR
				INNCCONFIR.EditValue = INNCCONFIR.Options(false);

				// INNCAUTCONFCOMPEN
				INNCAUTCONFCOMPEN.EditAttrs["class"] = "form-control";
				INNCAUTCONFCOMPEN.EditValue = INNCAUTCONFCOMPEN.CurrentValue; // DN
				INNCAUTCONFCOMPEN.PlaceHolder = RemoveHtml(INNCAUTCONFCOMPEN.Caption);

				// INNCAUTANULCOMPEN
				INNCAUTANULCOMPEN.EditAttrs["class"] = "form-control";
				INNCAUTANULCOMPEN.EditValue = INNCAUTANULCOMPEN.CurrentValue; // DN
				INNCAUTANULCOMPEN.PlaceHolder = RemoveHtml(INNCAUTANULCOMPEN.Caption);

				// ISCINTERCOMPEN
				ISCINTERCOMPEN.EditValue = ISCINTERCOMPEN.Options(false);

				// ISCMEDREMICOMPEN
				ISCMEDREMICOMPEN.EditAttrs["class"] = "form-control";
				ISCMEDREMICOMPEN.EditValue = ISCMEDREMICOMPEN.CurrentValue; // DN
				ISCMEDREMICOMPEN.PlaceHolder = RemoveHtml(ISCMEDREMICOMPEN.Caption);

				// ISCNUMMESCOMPEN
				ISCNUMMESCOMPEN.EditAttrs["class"] = "form-control";
				ISCNUMMESCOMPEN.EditValue = ISCNUMMESCOMPEN.CurrentValue; // DN
				ISCNUMMESCOMPEN.PlaceHolder = RemoveHtml(ISCNUMMESCOMPEN.Caption);

				// Call Row Rendered event
				Row_Rendered();
			}

			#pragma warning restore 1998

			// Aggregate list row values
			public void AggregateListRowValues() {
			}

			#pragma warning disable 1998

			// Aggregate list row (for rendering)
			public async Task AggregateListRow() {

				// Call Row Rendered event
				Row_Rendered();
			}

			#pragma warning restore 1998

			// Export document
			public dynamic ExportDoc;

			// Export data in HTML/CSV/Word/Excel/Email/PDF format
			public async Task ExportDocument(dynamic doc, DbDataReader dataReader, int startRec, int stopRec, string exportType = "") {
				if (dataReader == null || doc == null)
					return;
				if (!doc.ExportCustom) {

					// Write header
					doc.ExportTableHeader();
					if (doc.Horizontal) { // Horizontal format, write header
						doc.BeginExportRow();
						if (exportType == "view") {
							doc.ExportCaption(OID);
							doc.ExportCaption(ADNINGRESO);
							doc.ExportCaption(SLNORDSER);
							doc.ExportCaption(ISCESTPRO);
							doc.ExportCaption(GEENMedico);
							doc.ExportCaption(INNALMACE);
							doc.ExportCaption(GENARESER);
							doc.ExportCaption(ISCDETALL);
							doc.ExportCaption(GENARESER1);
							doc.ExportCaption(ISCSUMIORIGEN);
							doc.ExportCaption(ISCSUMIPENDI);
							doc.ExportCaption(INNORDDESC);
							doc.ExportCaption(ISCSUMGENPEN);
							doc.ExportCaption(ISCVRBASINC);
							doc.ExportCaption(ISCPORINCRE);
							doc.ExportCaption(ISCPORINCRE1);
							doc.ExportCaption(ISCVALINCRE);
							doc.ExportCaption(ISCVALINCRE1);
							doc.ExportCaption(ISCOIDORIHCRE);
							doc.ExportCaption(ISCTIPSOLDIS);
							doc.ExportCaption(INNDISFORREC);
							doc.ExportCaption(INNPENDICAB);
							doc.ExportCaption(ISCINDIDESA);
							doc.ExportCaption(ISCJUSTIFICA);
							doc.ExportCaption(ISCFECORIGEN);
							doc.ExportCaption(ISCGFMIDFOR);
							doc.ExportCaption(INNCPLAPRO);
							doc.ExportCaption(INNCCONFIR);
							doc.ExportCaption(INNCAUTCONFCOMPEN);
							doc.ExportCaption(INNCAUTANULCOMPEN);
							doc.ExportCaption(ISCINTERCOMPEN);
							doc.ExportCaption(ISCMEDREMICOMPEN);
							doc.ExportCaption(ISCNUMMESCOMPEN);
						} else {
							doc.ExportCaption(OID);
							doc.ExportCaption(ADNINGRESO);
							doc.ExportCaption(SLNORDSER);
							doc.ExportCaption(ISCESTPRO);
							doc.ExportCaption(GEENMedico);
							doc.ExportCaption(INNALMACE);
							doc.ExportCaption(GENARESER);
							doc.ExportCaption(GENARESER1);
							doc.ExportCaption(ISCSUMIORIGEN);
							doc.ExportCaption(ISCSUMIPENDI);
							doc.ExportCaption(INNORDDESC);
							doc.ExportCaption(ISCSUMGENPEN);
							doc.ExportCaption(ISCVRBASINC);
							doc.ExportCaption(ISCPORINCRE);
							doc.ExportCaption(ISCPORINCRE1);
							doc.ExportCaption(ISCVALINCRE);
							doc.ExportCaption(ISCVALINCRE1);
							doc.ExportCaption(ISCOIDORIHCRE);
							doc.ExportCaption(ISCTIPSOLDIS);
							doc.ExportCaption(INNDISFORREC);
							doc.ExportCaption(INNPENDICAB);
							doc.ExportCaption(ISCINDIDESA);
							doc.ExportCaption(ISCJUSTIFICA);
							doc.ExportCaption(ISCFECORIGEN);
							doc.ExportCaption(ISCGFMIDFOR);
							doc.ExportCaption(INNCPLAPRO);
							doc.ExportCaption(INNCCONFIR);
							doc.ExportCaption(INNCAUTCONFCOMPEN);
							doc.ExportCaption(INNCAUTANULCOMPEN);
							doc.ExportCaption(ISCINTERCOMPEN);
							doc.ExportCaption(ISCMEDREMICOMPEN);
							doc.ExportCaption(ISCNUMMESCOMPEN);
						}
						doc.EndExportRow();
					}
				}

				// Move to first record
				// For List page only. For View page, the recordset is alreay at the start record. // DN

				int recCnt = startRec - 1;
				if (exportType != "view") {
					if (Connection.SelectOffset) {
						await dataReader.ReadAsync();
					} else {
						for (int i = 0; i < startRec; i++) // Move to the start record and use do-while loop
							await dataReader.ReadAsync();
					}
				}
				int rowcnt = 0; // DN
				do { // DN
					recCnt++;
					if (recCnt >= startRec) {
						rowcnt = recCnt - startRec + 1;

						// Page break
						if (ExportPageBreakCount > 0) {
							if (rowcnt > 1 && (rowcnt - 1) % ExportPageBreakCount == 0)
								doc.ExportPageBreak();
						}
						LoadListRowValues(dataReader);

						// Render row
						RowType = Config.RowTypeView; // Render view
						ResetAttributes();
						await RenderListRow();
						if (!doc.ExportCustom) {
							doc.BeginExportRow(rowcnt); // Allow CSS styles if enabled
							if (exportType == "view") {
								await doc.ExportField(OID);
								await doc.ExportField(ADNINGRESO);
								await doc.ExportField(SLNORDSER);
								await doc.ExportField(ISCESTPRO);
								await doc.ExportField(GEENMedico);
								await doc.ExportField(INNALMACE);
								await doc.ExportField(GENARESER);
								await doc.ExportField(ISCDETALL);
								await doc.ExportField(GENARESER1);
								await doc.ExportField(ISCSUMIORIGEN);
								await doc.ExportField(ISCSUMIPENDI);
								await doc.ExportField(INNORDDESC);
								await doc.ExportField(ISCSUMGENPEN);
								await doc.ExportField(ISCVRBASINC);
								await doc.ExportField(ISCPORINCRE);
								await doc.ExportField(ISCPORINCRE1);
								await doc.ExportField(ISCVALINCRE);
								await doc.ExportField(ISCVALINCRE1);
								await doc.ExportField(ISCOIDORIHCRE);
								await doc.ExportField(ISCTIPSOLDIS);
								await doc.ExportField(INNDISFORREC);
								await doc.ExportField(INNPENDICAB);
								await doc.ExportField(ISCINDIDESA);
								await doc.ExportField(ISCJUSTIFICA);
								await doc.ExportField(ISCFECORIGEN);
								await doc.ExportField(ISCGFMIDFOR);
								await doc.ExportField(INNCPLAPRO);
								await doc.ExportField(INNCCONFIR);
								await doc.ExportField(INNCAUTCONFCOMPEN);
								await doc.ExportField(INNCAUTANULCOMPEN);
								await doc.ExportField(ISCINTERCOMPEN);
								await doc.ExportField(ISCMEDREMICOMPEN);
								await doc.ExportField(ISCNUMMESCOMPEN);
							} else {
								await doc.ExportField(OID);
								await doc.ExportField(ADNINGRESO);
								await doc.ExportField(SLNORDSER);
								await doc.ExportField(ISCESTPRO);
								await doc.ExportField(GEENMedico);
								await doc.ExportField(INNALMACE);
								await doc.ExportField(GENARESER);
								await doc.ExportField(GENARESER1);
								await doc.ExportField(ISCSUMIORIGEN);
								await doc.ExportField(ISCSUMIPENDI);
								await doc.ExportField(INNORDDESC);
								await doc.ExportField(ISCSUMGENPEN);
								await doc.ExportField(ISCVRBASINC);
								await doc.ExportField(ISCPORINCRE);
								await doc.ExportField(ISCPORINCRE1);
								await doc.ExportField(ISCVALINCRE);
								await doc.ExportField(ISCVALINCRE1);
								await doc.ExportField(ISCOIDORIHCRE);
								await doc.ExportField(ISCTIPSOLDIS);
								await doc.ExportField(INNDISFORREC);
								await doc.ExportField(INNPENDICAB);
								await doc.ExportField(ISCINDIDESA);
								await doc.ExportField(ISCJUSTIFICA);
								await doc.ExportField(ISCFECORIGEN);
								await doc.ExportField(ISCGFMIDFOR);
								await doc.ExportField(INNCPLAPRO);
								await doc.ExportField(INNCCONFIR);
								await doc.ExportField(INNCAUTCONFCOMPEN);
								await doc.ExportField(INNCAUTANULCOMPEN);
								await doc.ExportField(ISCINTERCOMPEN);
								await doc.ExportField(ISCMEDREMICOMPEN);
								await doc.ExportField(ISCNUMMESCOMPEN);
							}
							doc.EndExportRow(rowcnt);
						}
					}

					// Call Row Export server event
					if (doc.ExportCustom)
						Row_Export(dataReader);
				} while (recCnt < stopRec && await dataReader.ReadAsync()); // DN
				if (!doc.ExportCustom)
					doc.ExportTableFooter();
			}

			#pragma warning disable 219

			// Lookup data from table
			public async Task<JsonBoolResult> Lookup() {
				Language = Language ?? new Lang(Config.LanguageFolder, Post("language"));

				// Load lookup parameters
				bool distinct = Post<bool>("distinct");
				string linkField = Post("linkField");
				StringValues sv;
				var displayFields = Form.TryGetValue("displayFields[]", out sv) ? sv.ToList() : new List<string>();
				var parentFields = Form.TryGetValue("parentFields[]", out sv) ? sv.ToList() : new List<string>();
				var childFields = Form.TryGetValue("childFields[]", out sv) ? sv.ToList() : new List<string>();
				var filterFields = Form.TryGetValue("filterFields[]", out sv) ? sv.ToList() : new List<string>();
				var filterFieldVars = Form.TryGetValue("filterFieldVars[]", out sv) ? sv.ToList() : new List<string>();
				var filterOperators = Form.TryGetValue("filterOperators[]", out sv) ? sv.ToList() : new List<string>();
				var autoFillSourceFields = Form.TryGetValue("autoFillSourceFields[]", out sv) ? sv.ToList() : new List<string>();
				bool formatAutoFill = false;
				string lookupType = Post("ajax");
				int pageSize = -1;
				int offset = -1;
				string searchValue = "";
				if (SameText(lookupType, "modal")) {
					searchValue = Post("sv");
					if (Empty(Post("recperpage")))
						pageSize = 10;
					else
						pageSize = Post<int>("recperpage");
					offset = Post<int>("start");
				} else if (SameText(lookupType, "autosuggest")) {
					searchValue = Get("q");
					pageSize = IsNumeric(Param("n")) ? Param<int>("n") : -1;
					if (pageSize <= 0)
						pageSize = Config.AutoSuggestMaxEntries;
					int start = IsNumeric(Param("start")) ? Param<int>("start") : -1;
					int page = IsNumeric(Param("page")) ? Param<int>("page") : -1;
					offset = start >= 0 ? start : (page > 0 && pageSize > 0 ? (page - 1) * pageSize : 0);
				}
				string userSelect = Decrypt(Post("s"));
				string userFilter = Decrypt(Post("f"));
				string userOrderBy = Decrypt(Post("o"));

				// Selected records from modal, skip parent/filter fields and show all records
				StringValues keys;
				if (Form.TryGetValue("keys[]", out keys)) { // Selected records from modal
					parentFields = new List<string>();
					filterFields = new List<string>();
					filterFieldVars = new List<string>();
					offset = -1;
					pageSize = -1;
				}

				// Create lookup object and output JSON
				var lookup = new Lookup(linkField, TableVar, distinct, linkField, displayFields, parentFields, childFields, filterFields, filterFieldVars, autoFillSourceFields);
				for (int i = 0; i < filterFields.Count; i++) { // Set up filter operators
					if (!Empty(filterOperators[i]))
						lookup.SetFilterOperator(filterFields[i], filterOperators[i]);
				}
				lookup.LookupType = lookupType; // Lookup type
				if (!StringValues.IsNullOrEmpty(keys)) { // Selected records from modal
					lookup.FilterValues.Add(string.Join(",", keys.ToArray()));
				} else { // Lookup values
					lookup.FilterValues.Add(Post<string>("v0") ?? Post("lookupValue"));
				}
				int cnt = IsList(filterFields) ? filterFields.Count : 0;
				for (int i = 1; i <= cnt; i++)
					lookup.FilterValues.Add(UrlDecode(Post("v" + i)));
				lookup.SearchValue = searchValue;
				lookup.PageSize = pageSize;
				lookup.Offset = offset;
				if (userSelect != "")
					lookup.UserSelect = userSelect;
				if (userFilter != "")
					lookup.UserFilter = userFilter;
				if (userOrderBy != "")
					lookup.UserOrderBy = userOrderBy;
				return await lookup.ToJson();
			}

			#pragma warning restore 219

			// Table filter
			private string _tableFilter = null;
			public string TableFilter {
				get => _tableFilter ?? "";
				set => _tableFilter = value;
			}

			// TblBasicSearchDefault
			private string _tableBasicSearchDefault = null;
			public string TableBasicSearchDefault {
				get => _tableBasicSearchDefault ?? "";
				set => _tableBasicSearchDefault = value;
			}

			#pragma warning disable 1998

			// Get file data
			public async Task<IActionResult> GetFileData(string fldparm, string key, bool resize, int width = -1, int height = -1) {
				if (width < 0)
					width = Config.ThumbnailDefaultWidth;
				if (height < 0)
					height = Config.ThumbnailDefaultHeight;

				// No binary fields
				return JsonBoolResult.FalseResult; // Incorrect key
			}

			#pragma warning restore 1998

			// Table level events
			// Recordset Selecting event

			public void Recordset_Selecting(ref string filter) {

				// Enter your code here
			}

			// Recordset Search Validated event
			public void Recordset_SearchValidated() {

				// Enter your code here
			}

			// Recordset Searching event
			public void Recordset_Searching(ref string filter) {

				// Enter your code here
			}

			// Row_Selecting event
			public void Row_Selecting(ref string filter) {

				// Enter your code here
			}

			// Row Selected event
			public void Row_Selected(Dictionary<string, object> row) {

				//Log("Row Selected");
			}

			// Row Inserting event
			public bool Row_Inserting(Dictionary<string, object> rsold, Dictionary<string, object> rsnew) {

				// Enter your code here
				// To cancel, set return value to False and error message to CancelMessage

				return true;
			}

			// Row Inserted event
			public void Row_Inserted(Dictionary<string, object> rsold, Dictionary<string, object> rsnew) {

				//Log("Row Inserted");
			}

			// Row Updating event
			public bool Row_Updating(Dictionary<string, object> rsold, Dictionary<string, object> rsnew) {

				// Enter your code here
				// To cancel, set return value to False and error message to CancelMessage

				return true;
			}

			// Row Updated event
			public void Row_Updated(Dictionary<string, object> rsold, Dictionary<string, object> rsnew) {

				//Log("Row Updated");
			}

			// Row Update Conflict event
			public bool Row_UpdateConflict(Dictionary<string, object> rsold, Dictionary<string, object> rsnew) {

				// Enter your code here
				// To ignore conflict, set return value to false

				return true;
			}

			// Row Export event
			// ExportDoc = export document object

			public virtual void Row_Export(DbDataReader rs) {

				//ExportDoc.Text.Append("<div>" + MyField.ViewValue +"</div>"); // Build HTML with field value: rs["MyField"] or MyField.ViewValue
			}

			// Page Exporting event
			// ExportDoc = export document object

			public virtual bool Page_Exporting() {

				//ExportDoc.Text.Append("<p>" + "my header" + "</p>"); // Export header
				//return false; // Return FALSE to skip default export and use Row_Export event

				return true; // Return TRUE to use default export and skip Row_Export event
			}

			// Page Exported event
			// ExportDoc = export document object

			public virtual void Page_Exported() {

				//ExportDoc.Text.Append("my footer"); // Export footer
				//Log("Text: {Text}", ExportDoc.Text);

			}

			// Recordset Deleting event
			public bool Row_Deleting(Dictionary<string, object> rs) {

				// Enter your code here
				// To cancel, set return value to False and error message to CancelMessage

				return true;
			}

			// Row Deleted event
			public void Row_Deleted(Dictionary<string, object> rs) {

				//Log("Row Deleted");
			}

			// Email Sending event
			public virtual bool Email_Sending(Email email, dynamic args) {

				//Log(email);
				return true;
			}

			// Lookup Selecting event
			public void Lookup_Selecting(DbField fld, ref string filter) {

				// Enter your code here
			}

			// Row Rendering event
			public void Row_Rendering() {

				// Enter your code here
			}

			// Row Rendered event
			public void Row_Rendered() {

				//VarDump(<FieldName>); // View field properties
			}

			// User ID Filtering event
			public void UserID_Filtering(ref string filter) {

				// Enter your code here
			}
		}
	}
}
