CLASS zcl_rap_eml_jde DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RAP_EML_JDE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    " step 1 - READ - exist
*    READ ENTITIES OF ZI_RAP_Travel_jde
*      ENTITY travel
*        FROM VALUE #( ( TravelUUID = 'F9D103C0ED0149641800001A585D6A0D' ) )
*      RESULT DATA(travels).
*    out->write( travels ).
**********************************************************************
*    " step 2 - READ with Fields - to get more info
*    READ ENTITIES OF ZI_RAP_Travel_jde
*      ENTITY travel
*        FIELDS ( AgencyID CustomerID )
*      WITH VALUE #( ( TravelUUID = 'F9D103C0ED0149641800001A585D6A0D' ) )
*      RESULT DATA(travels).
*    out->write( travels ).
**********************************************************************
*    " step 3 - READ with All Fields
*    READ ENTITIES OF ZI_RAP_Travel_jde
*      ENTITY travel
*        ALL FIELDS
*      WITH VALUE #( ( TravelUUID = '22C2F52A33CA1EDDABAD24D1DECD05AF' ) )
*      RESULT DATA(travels).
*
*    out->write( travels ).
**********************************************************************
*    " step 4 - READ By Association
*    READ ENTITIES OF ZI_RAP_Travel_jde
*      ENTITY travel BY \_Booking
*        ALL FIELDS WITH VALUE #( ( TravelUUID = 'F9D103C0ED0149641800001A585D6A0D' ) )
*      RESULT DATA(bookings).
*
*    out->write( bookings ).
**********************************************************************
*     " step 5 - Unsuccessful READ
*     READ ENTITIES OF ZI_RAP_Travel_jde
*       ENTITY travel
*         ALL FIELDS WITH VALUE #( ( TravelUUID = '11111111111111111111111111111111' ) )
*       RESULT DATA(travels)
*       FAILED DATA(failed)
*       REPORTED DATA(reported).
*
*     out->write( travels ).
*     out->write( failed ).    " complex structures not supported by the console output
*     out->write( reported ).  " complex structures not supported by the console output
**********************************************************************

*     " step 6 - MODIFY Update
*     MODIFY ENTITIES OF ZI_RAP_Travel_jde
*       ENTITY travel
*         UPDATE
*           SET FIELDS WITH VALUE
*             #( ( TravelUUID  = 'F9D103C0ED0149641800001A585D6A0D'
*                  Description = 'I like RAP@openSAP' ) )
*
*      FAILED DATA(failed)
*      REPORTED DATA(reported).
*
*     " step 6b - Commit Entities
*     COMMIT ENTITIES
*       RESPONSE OF ZI_RAP_Travel_jde
*       FAILED     DATA(failed_commit)
*       REPORTED   DATA(reported_commit).

*     out->write( 'Update done' ).
**********************************************************************

*    " step 7 - MODIFY Create
*    MODIFY ENTITIES OF ZI_RAP_Travel_jde
*      ENTITY travel
*        CREATE
*          SET FIELDS WITH VALUE
*            #( ( %cid        = 'MyContentID_1'
*                 AgencyID    = '70012'
*                 CustomerID  = '14'
*                 BeginDate   = cl_abap_context_info=>get_system_date( )
*                 EndDate     = cl_abap_context_info=>get_system_date( ) + 10
*                 Description = 'I like RAP@openSAP' ) )
*
*     MAPPED DATA(mapped)
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    out->write( mapped-travel ).
*
*    COMMIT ENTITIES
*      RESPONSE OF ZI_RAP_Travel_jde
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Create done' ).

**********************************************************************
*    " step 8 - MODIFY Delete
*    MODIFY ENTITIES OF ZI_RAP_Travel_jde
*      ENTITY travel
*        DELETE FROM
*          VALUE
*            #( ( TravelUUID  = '22C2F52A33CA1EDDABAD24D1DECD05AF' ) )
*
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    COMMIT ENTITIES
*      RESPONSE OF ZI_RAP_Travel_jde
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Delete done' ).

  ENDMETHOD.
ENDCLASS.
