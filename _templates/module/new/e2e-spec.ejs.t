---
to: test/e2e/<%= name %>/<%= name %>.e2e-spec.ts
---

import { Test, TestingModule } from '@nestjs/testing';
import { INestApplication, CanActivate, forwardRef } from '@nestjs/common';
import { GraphQLModule } from '@nestjs/graphql';
import request from 'supertest';
import {
  closeDbConnection,
  DbTestModule,
} from '../../../src/db/db.test.module';
import { Model } from 'mongoose';
import { AuthGuard } from '../../../src/auth/auth.guard';
import { AuthService } from '../../../src/auth/auth.service';
import { CreatorFunction, entityFactory } from '../../helpers';
import { <%= h.changeCase.pascal(name) %>Module } from '../../../src/<%= name %>/<%= name %>.module';
import { <%= h.changeCase.pascal(name) %>Document } from '../../../src/<%= name %>/db/<%= name %>.model';

let app: INestApplication;
const MockAuthGuard: CanActivate = { canActivate: jest.fn(() => true) };
let MockAuthService = {
  getCurrentUserId: jest.fn(),
  deleteUserFromCognito: jest.fn(),
  adminDeleteUserFromCognito: jest.fn(),
};
let getCurrentUserIdMock: jest.SpyInstance;
let  <%= h.changeCase.pascal(name) %>Model: Model< <%= h.changeCase.pascal(name) %>Document>;
let  <%= h.changeCase.camel(name) %>Factory: CreatorFunction< <%= h.changeCase.pascal(name) %>Document>;

describe(<%= h.changeCase.pascal(name) %>Module, () => {
  beforeEach(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [
        DbTestModule(),
        GraphQLModule.forRoot({
          autoSchemaFile: true,
        }),
        <%= h.changeCase.pascal(name) %>Module
      ],
    })
      .overrideGuard(AuthGuard)
      .useValue(MockAuthGuard)
      .overrideProvider(AuthService)
      .useValue(MockAuthService)
      .compile();

    getCurrentUserIdMock = jest.spyOn(MockAuthService, 'getCurrentUserId');

    <%= h.changeCase.pascal(name) %>Model = moduleFixture.get<Model<<%= h.changeCase.pascal(name) %>Document>>(
      '<%= h.changeCase.pascal(name) %>Model'
    );

    <%= h.changeCase.camel(name) %>Factory = entityFactory(<%= h.changeCase.pascal(name) %>Model, {});

    app = moduleFixture.createNestApplication();
    await app.init();

  });

  afterAll(async () => {
    await closeDbConnection();
  });

    afterEach(async () => {
    await <%= h.changeCase.pascal(name) %>Model.deleteMany();
    jest.clearAllMocks();
  });

  describe('test describe', () => {
    it('test', () => {})
  });
});
