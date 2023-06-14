<html>
    <head>
      <title>Place Autocomplete Address Form</title>
      <!--- bootstrap --->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
      <link
        href="https://fonts.googleapis.com/css?family=Roboto:400,500"
        rel="stylesheet"
      />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
      <link rel="stylesheet" type="text/css" href="./style.css" />
      <script src="https://maps.googleapis.com/maps/api/js?libraries=places&callback=initAutocomplete&language=en&output=json&key=AIzaSyC0KiiitbGw4W4rPuXMP3QXJM7X19S0SBw" async defer></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
      <script defer type="module" src="./index.js"></script>
    </head>
    <body>
      <!-- Note: The address components in this sample are based on North American address format. You might need to adjust them for the locations relevant to your app. For more information, see
  https://developers.google.com/maps/documentation/javascript/examples/places-autocomplete-addressform
      -->
    
      <cfparam  name="nazione" default="">
      <cfparam  name="lingua" default="">
      <cfparam  name="postcode" default="">
      <cfset errorlist = "">

      <cfif isDefined("ship-address")>
        <cfif isEmpty(form.postcode)>
          <cfset errorlist = listAppend(errorlist, "errorpostcode")>
        </cfif>
      </cfif>
        
        <select onchange="changelang()" class="ms-5 me-5 mt-5" name="nazione" id="nazione">
          <option value="it" <cfif nazione eq "it">selected</cfif>>italy</option>
          <option value="fr" <cfif nazione eq "fr">selected</cfif> >france</option>
          <option value="es" <cfif nazione eq "es">selected</cfif>>espain</option>
          <option value="de" <cfif nazione eq "de">selected</cfif>>germany</option>
        </select>
        
        <!--- <label>scegli la lingua</label>
          <select onchange="changelang()" class="ms-2 mt-5" name="lingua" id="lingua">
            <option value="es" <cfif lingua eq "es">selected</cfif>>ES</option>
            <option value="fr" <cfif lingua eq "fr">selected</cfif> >FR</option>
            <option value="it" <cfif lingua eq "it">selected</cfif>>IT</option>
            <option value="de" <cfif lingua eq "de">selected</cfif>>DE</option>
          </select> --->
        <cfoutput>
          <form id="address-form" action="" method="get" autocomplete="off">
            <p class="title">Sample address form for North America</p>
            <p class="note"><em>* = required field</em></p>
            <label class="full-field">
              <!-- Avoid the word "address" in id, name, or label text to avoid browser autofill from conflicting with Place Autocomplete. Star or comment bug https://crbug.com/587466 to request Chromium to honor autocomplete="off" attribute. -->
              <span class="form-label">Deliver to*</span>
              <input
                id="ship-address"
                name="ship-address"
                required
                autocomplete="off"
              />
            </label>
            <label class="slim-field-left">
              <span class="form-label">Address*</span>
              <input id="route" name="route" />
            </label>
            <label class="slim-field-right">
              <span class="form-label">Civic number </span>
              <input id="street_number" name="street_number" />
            </label>
            <label class="full-field">
              <span class="form-label">Apartment, unit, suite, or floor </span>
              <input id="address2" name="address2" />
            </label>
            <label class="full-field">
              <span class="form-label">City*</span>
              <input id="locality" name="locality" required />
            </label>
            <label class="slim-field-left">
              <span class="form-label">State/Province*</span>
              <input id="state" name="state" required />
            </label>
            <label class="slim-field-right" for="postal_code">
              <span class="form-label">Postal code*</span>
              <input id="postcode" name="postcode" value="#postcode#" required />
              <cfif listFind(errorlist, "errorpostcode")>           
                <div class="text-danger">
                  il CAP non può essere vuoto!
                </div>
              </cfif>
            </label>
            <button type="button" class="my-button">Save address</button>
      
            <!-- Reset button provided for development testing convenience.
            Not recommended for user-facing forms due to risk of mis-click when aiming for Submit button. -->
            <input type="reset" value="Clear form" />
          </form>
        </cfoutput>
      <!-- Replace Powered By Google image src with self hosted image. https://developers.google.com/maps/documentation/places/web-service/policiesother_attribution_requirements -->
      <img
        class="powered-by-google"
        src="https://storage.googleapis.com/geo-devrel-public-buckets/powered_by_google_on_white.png"
        alt="Powered by Google"
      />
  
      <!-- 
        The `defer` attribute causes the callback to execute after the full HTML
        document has been parsed. For non-blocking uses, avoiding race conditions,
        and consistent behavior across browsers, consider loading using Promises.
        See https://developers.google.com/maps/documentation/javascript/load-maps-js-api
        for more information.
        -->
    </body>
  </html>