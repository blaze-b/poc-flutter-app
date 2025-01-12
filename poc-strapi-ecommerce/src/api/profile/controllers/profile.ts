/**
 * profile controller
 */

import { factories } from '@strapi/strapi'

export default factories.createCoreController('api::profile.profile', (Strapi) => ({
     createMe: async (ctx, next) => {
        try {
            console.log(`User details: ${ctx}`);

            const user = ctx.state.user;

            console.log(`User details: ${user}`);

            if (!user) {
                return ctx.unauthorized("No athorized user found!");
            }

            const result: any = strapi.entityService.create('api::profile.profile', {
                data: {
                    fullName: ctx.request.body.fullName,
                    email: user.email,
                    user: user.id
                }
            });

            console.log(`Final response details: ${result}`);

            return result;

        } catch (err) {
            return ctx.internalServerError(err.message);
        }
    },
    getMe: async (ctx, next) => {
        try {
            const user = ctx.state.user;

            console.log(`User details: ${user}`);

            if (!user) {
                return ctx.unauthorized("No athorized user found!");
            }

            const result = await strapi.db.query('api::profile.profile').findOne({
                where: {
                    user: {
                        id: {
                            $eq: user.id
                        }
                    }
                },
                populate: {
                    image: true,
                }
            });

            console.log(`Finale response details: ${result}`);

            return result;
        } catch (err) {
            return ctx.internalServerError([{ messages: [{ id: 'Error' }] }]);
        }
    }
}));