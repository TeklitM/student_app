library util;

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'
;
part 'helpers/Keys.dart';
part 'helpers/http/http_attrib_options.dart';
part 'helpers/http/http_service.dart';
part 'helpers/http/http_service_impl.dart';
part 'helpers/http/http_status_worth_retrying.dart';
part './util_dependency.dart';
